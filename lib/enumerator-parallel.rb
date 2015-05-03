require "enumerator-parallel/version"
require "parallel"

module Enumerable
  def parallel(options = {})
    Enumerator::Parallel.new(self, options)
  end
  alias par parallel
end

class Enumerator::Parallel
  def initialize(enum, options)
    mappings = { processes: :in_processes, threads: :in_threads }
    @enum, @options = enum.to_a, Hash[options.map { |k, v| [(mappings[k] || k), v] }]
  end

  def each(&block)
    ::Parallel.each(@enum, @options, &block)
  end

  def map(&block)
    ::Parallel.map(@enum, @options, &block)
  end

  def all?(&block)
    map(&block).all?
  end

  def any?(&block)
    map(&block).any?
  end

  %w|group_by select reject|.each do |mth|
    define_method(mth) do |*args, &block|
      map_num = map(&block)
      @enum.send(mth).with_index { |_, i| map_num[i] }
    end
  end

  def count(&block)
    map(&block).count(true)
  end
end
