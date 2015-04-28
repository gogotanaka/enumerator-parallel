require "parallel_enumerable/version"
require "parallel"

module ParallelEnumerable
  module ::Enumerable
    def _map(options = {}, &block)
      ::Parallel.map(self.to_a, options, &block)
    end

    def _each(options = {}, &block)
      ::Parallel.each(self.to_a, options, &block)
    end

    def _each_with_index(options = {}, &block)
      ::Parallel.each_with_index(self.to_a, options, &block)
    end

    def _map_with_index(options = {}, &block)
      ::Parallel.map_with_index(self.to_a, options, &block)
    end
  end
end
