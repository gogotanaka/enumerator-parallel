require 'minitest_helper'

class TestParallelEnumerable < Minitest::Test
  def setup
    @enum3  = { a: 1, b: 2, c: 3 }
    @enum10 = (1..10)
    @enum20 = (1..20).to_a
  end

  def test_main
    assert_equal_no_order @enum10, @enum10.par(threads: 10).map { |n| sleep 1; n }
    assert_equal_no_order @enum20.select { |n| n < 10 }, @enum20.par(threads: 20).select { |n| sleep 1; n < 10 }
  end

  def assert_equal_no_order(exp, act)
    assert_equal(exp.sort, act.sort)
  end
end
