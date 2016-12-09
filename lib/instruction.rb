# This class is used for one complete movement of robot.
class Instruction
  attr_accessor :x_position, :y_position, :moves, :facing
  def initialize(x_position, y_position, facing)
    @x_position = x_position.to_i
    @y_position = y_position.to_i
    @facing = facing
    @moves = []
  end
end
