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

  def select(&block)
    map_num = map(&block)
    @enum.select.with_index { |_, i| map_num[i] }
  end

  def reject(&block)
    map_num = map(&block)
    @enum.reject.with_index { |_, i| map_num[i] }
  end
end
