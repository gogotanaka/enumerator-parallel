require 'minitest_helper'

class TestParallelEnumerable < Minitest::Test
  def test_it_does_something_useful
    [1, 2, 3]._each(in_processes: 3) { |n| sleep 1; p n }
  end
end
