require 'minitest_helper'

class TestParallelEnumerable < Minitest::Test
  def test_it_does_something_useful
    [1, 2, 3].parallel(in_processes: 3).each { |n| sleep 1; p n }
    [1, 2, 3].parallel(in_processes: 3).map { |n| sleep 1; p n }
  end
end
