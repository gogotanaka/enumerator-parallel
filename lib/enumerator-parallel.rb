require "enumerator-parallel/version"
require "parallel"

module Enumerable
  def parallel(options = {})
    Enumerator::Parallel.new(self, options)
  end
end

class Enumerator::Parallel
  def initialize(enum, options)
    @enum, @options = enum, options
  end

  def map(options = {}, &block)
    ::Parallel.map(@enum.to_a, @options, &block)
  end

  def each(options = {}, &block)
    ::Parallel.each(@enum.to_a, @options, &block)
  end

  def each_with_index(options = {}, &block)
    ::Parallel.each_with_index(@enum.to_a, @options, &block)
  end

  def map_with_index(options = {}, &block)
    ::Parallel.map_with_index(@enum.to_a, @options, &block)
  end
end
