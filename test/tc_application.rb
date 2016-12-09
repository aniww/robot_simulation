require_relative '../simulator'
require 'test/unit'
# Test for application class
class TestApplication < Test::Unit::TestCase
  def setup
    dimension_x = 5
    dimension_y = 5
    @app = Application.new('test_data.txt', dimension_x, dimension_y)
  end

  def test_position_details
    assert_equal(%w(0 0 NORTH), @app.position_details('PLACE 0,0,NORTH'))
  end

  def test_file_not_found
    assert_equal(nil, @app.read_commands_file(''))
  end
end
