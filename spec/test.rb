gem 'minitest'
require 'minitest/autorun'
require_relative '../lib/normally'

class TestNormally < Minitest::Test
  def test_normally_block_executes_when_but_if_condition_is_false
    math_makes_sense = nil

    normally {
      math_makes_sense = true
    }.but_if (2 + 2 == 5) {
      math_makes_sense = false
    }

    assert_equal true, math_makes_sense
  end

  def test_but_if_block_executes_when_but_if_condition_is_true
    clouds = 10
    rain_likely = nil

    normally {
      rain_likely = false
    }.but_if (clouds > 9) {
      rain_likely = true
    }

    assert_equal true, rain_likely
  end

  def test_happy_path_does_not_execute_when_sad_path_executes
    grade = 9
    gpa = 1.5

    normally {
      grade += 1
    }.but_if (gpa < 2) { # you get held back
    }

    assert_equal 9, grade
  end

  def test_sad_path_does_not_execute_when_happy_path_executes
    coins = 3
    game_over = false

    normally {
      coins -= 1
    }.but_if (coins == 0) {
      game_over = true
    }

    assert_equal false, game_over
  end

  def test_in_the_happy_case_return_the_value_of_the_normally_block
    math_makes_sense = normally { true }
      .but_if (2 + 2 == 5) { false }

    assert_equal true, math_makes_sense
  end

  def test_in_the_sad_case_return_the_value_of_the_but_if_block
    hours_slept = 5

    math_test_grade = normally { 'A' }
      .but_if (hours_slept < 6) { 'B-' }

    assert_equal 'B-', math_test_grade
  end
end
