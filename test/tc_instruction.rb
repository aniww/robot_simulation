require_relative '../lib/instruction'
require 'test/unit'
# Test for instruction class
class TestInstruction < Test::Unit::TestCase
  def test_initialize
    instruction = Instruction.new(0, 3, 'NORTH')
    assert_equal(0, instruction.x_position)
    assert_equal(3, instruction.y_position)
    assert_equal('NORTH', instruction.facing)
    assert_not_equal(1, instruction.x_position)
    assert_not_equal(2, instruction.y_position)
    assert_not_equal('WEST', instruction.facing)
  end
end
