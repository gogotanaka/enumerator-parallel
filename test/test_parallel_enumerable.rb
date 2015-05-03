require 'minitest_helper'

class TestParallelEnumerable < Minitest::Test
  def setup
    @enum3  = { a: 1, b: 2, c: 3 }
    @enum10 = (1..10)
    @enum20 = (1..20).to_a

    @enum_par3  = { a: 1, b: 2, c: 3 }
    @enum_par10 = (1..10).par(threads: 10)
    @enum_par20 = (1..20).to_a.par(threads: 20)
  end

  def test_main
    assert_equal @enum20, @enum_par20.map { |n| sleep 1; n }
    assert_equal @enum20.select { |n| n < 10 }, @enum_par20.select { |n| sleep 1; n < 10 }
    assert_equal @enum20.reject { |n| n < 10 }, @enum_par20.reject { |n| sleep 1; n < 10 }

    assert @enum_par20.all? { |n| sleep 1; n > 0 }
    assert @enum_par20.any? { |n| sleep 1; n == 1 }
  end
end
