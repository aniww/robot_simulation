require './instruction'
require './robot'
puts '#### Robot Simulation ####'

@instructions = []

def position_details(line)
  line.slice! 'PLACE '
  line.split(',')
end

def add_instruction(line)
  if line.include? 'PLACE'
    position = position_details line
    @instructions << Instruction.new(position[0], position[1], position[2])
  else
    @instructions.last.moves << line
  end
end

def read_commands_file(path)
  if File.file?(path)
    File.readlines(path).each do |line|
      line = line.strip.chomp
      add_instruction line
    end
  else
    puts "File doesn't exist:- #{path}"
  end
end

def show_instruction(instruction)
  print 'PLACE '
  print instruction.x_position
  print ','
  print instruction.y_position
  print ','
  puts instruction.facing
end

def process_instructions
  @instructions.each do |instruction|
    show_instruction(instruction)
    instruction.moves.each do |move|
      puts move
    end
  end
end

read_commands_file ARGV[0]
process_instructions
