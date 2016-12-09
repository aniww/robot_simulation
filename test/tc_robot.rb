require_relative '../lib/robot'
require 'test/unit'
# Test for robot class
class TestRobot < Test::Unit::TestCase
  def setup
    @robot = Robot.new(0, 3, 'NORTH', 5, 5)
  end

  def test_initialize
    @robot = Robot.new(0, 3, 'NORTH', 5, 5)
    assert_equal(0, @robot.x_position)
    assert_equal(3, @robot.y_position)
    assert_equal('NORTH', @robot.facing)
    assert_equal(5, @robot.max_x)
    assert_equal(5, @robot.max_y)
    assert_not_equal(1, @robot.x_position)
    assert_not_equal(2, @robot.y_position)
    assert_not_equal('EAST', @robot.facing)
    assert_not_equal(4, @robot.max_x)
    assert_not_equal(4, @robot.max_y)
  end

  def test_location
    assert_equal([0, 3, 'NORTH'], @robot.location)
  end

  def test_turn
    assert_equal("WEST", @robot.turn('LEFT'))
  end
end
