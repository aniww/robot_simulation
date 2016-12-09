require './instruction'
require './robot'

# This class is used for robot simulation.
class Application
  def initialize(file, max_x, max_y)
    puts '#### Robot Simulation ####'
    @instructions = []
    @max_x = max_x
    @max_y = max_y
    read_commands_file file
  end

  def read_commands_file(path)
    if File.file?(path)
      File.readlines(path).each do |line|
        line = line.strip.chomp
        add_instruction line
      end
      execute_commands
    else
      puts "File doesn't exist:- #{path}"
    end
  end

  def add_instruction(line)
    if line.include? 'PLACE'
      position = position_details line
      if position.length == 3
        @instructions << Instruction.new(position[0], position[1], position[2])
      end
    elsif @instructions.last.is_a?(Instruction)
      @instructions.last.moves << line
    end
  end

  def position_details(line)
    line.slice! 'PLACE '
    line.split(',')
  end

  def show_instruction(instruction)
    puts ' '
    print 'PLACE '
    print instruction.x_position
    print ','
    print instruction.y_position
    print ','
    puts instruction.facing
  end

  def process_instruction(instruction)
    robot = Robot.new(instruction.x_position, instruction.y_position,
                      instruction.facing, @max_x, @max_y)
    show_instruction(instruction)
    robot.operate(instruction.moves)
  end

  def execute_commands
    @instructions.each do |instruction|
      process_instruction(instruction)
    end
  end
end
