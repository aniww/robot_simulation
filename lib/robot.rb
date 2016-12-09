# This class will hold current position of robot.
class Robot
  attr_accessor :x_position, :y_position, :facing, :max_x, :max_y
  def initialize(x_position, y_position, facing, max_x, max_y)
    @x_position = x_position.to_i
    @y_position = y_position.to_i
    @facing = facing
    @max_y = max_y.to_i
    @max_x = max_x.to_i
  end

  def location
    [x_position, y_position, facing]
  end

  def move
    if facing == 'NORTH'
      @y_position += 1 if valid_position?(@y_position + 1, 'Y')
    elsif facing == 'EAST'
      @x_position += 1 if valid_position?(@y_position + 1, 'X')
    elsif facing == 'WEST'
      @x_position -= 1 if valid_position?(@x_position - 1, 'X')
    elsif facing == 'SOUTH'
      @y_position -= 1 if valid_position?(@x_position - 1, 'Y')
    end
  end

  def valid_position?(position, axis)
    position <= (axis == 'Y' ? max_y : max_x) && position > 0
  end

  def turn(direction)
    directions = %w(WEST NORTH EAST SOUTH)
    current_direction_index = directions.index(facing)
    if direction == 'LEFT'
      @facing = directions[current_direction_index - 1]
    elsif direction == 'RIGHT'
      @facing = directions[current_direction_index + 1] || directions[0]
    end
  end

  def operate(commands)
    commands.each do |command|
      trigger(command)
    end
  end

  def trigger(command)
    puts command
    if command == 'MOVE'
      move
    elsif command == 'LEFT' || command == 'RIGHT'
      turn(command)
    elsif command == 'REPORT'
      puts 'Output:-'
      puts location.inspect
    end
  end
end
