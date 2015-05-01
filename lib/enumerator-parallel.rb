require "enumerator-parallel/version"
require "parallel"

module Enumerable
  def parallel(options = {})
    Enumerator::Parallel.new(self, options)
  end
  alias par parallel
end

class Enumerator::Parallel
  include Enumerable
  def initialize(enum, options)
    mappings = { processes: :in_processes, threads: :in_threads }
    @enum, @options = enum, Hash[options.map { |k, v| [(mappings[k] || k), v] }]
  end

  def each(options = {}, &block)
    ::Parallel.each(@enum, @options, &block)
  end

  def map(options = {}, &block)
    ::Parallel.map(@enum, @options, &block)
  end
end
