require './application'
# Set max dimension values for table grid below example is for 5 X 5 units.
dimension_x = 5
dimension_y = 5
app = Application.new(ARGV[0], dimension_x, dimension_y)
