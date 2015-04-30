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
    @enum, @options = enum.to_a, options
  end

  def map(options = {}, &block)
    ::Parallel.map(@enum, @options, &block)
  end

  def each(options = {}, &block)
    ::Parallel.each(@enum, @options, &block)
  end

  def each_with_index(options = {}, &block)
    ::Parallel.each_with_index(@enum, @options, &block)
  end

  def map_with_index(options = {}, &block)
    ::Parallel.map_with_index(@enum, @options, &block)
  end
end
