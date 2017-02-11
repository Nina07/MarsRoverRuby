puts "Please enter starting position, X"
x = gets.chomp.to_i
puts "Please enter starting position, Y"
y = gets.chomp.to_i
puts "Enter initial direction"
initial_direction = gets.chomp
input = []
puts "Please enter the input string(M,L,R) and type exit when done"
while (data = gets.chomp) != 'exit'
  input << data
end

$position = { x: x, y: y , current_face: initial_direction}

class Rover
	def calculate_position(user_command)
		case user_command
			when 'm' then move_forward
			when 'l' then	turn_left
			when 'r' then turn_right
		end
	end

	protected
	def turn_right
		$position[:current_face] = case $position[:current_face]
			when 'N' then 'E'
			when 'S' then 'W'
			when 'W' then 'N'
			when 'E' then 'S'
		end
	end

	def turn_left
		$position[:current_face] = case $position[:current_face]
			when 'N' then 'W'
			when 'S' then 'E'
			when 'W' then 'S'
			when 'E' then 'N'
		end
	end

	def move_forward
		new_x = 0; new_y = 0;
		x, y = case $position[:current_face]
      when 'N' then [0, 1]
      when 'S' then [0, -1]
      when 'E' then [1, 0]
      when 'W' then [-1, 0]
    end
    new_x = $position[:x] + x
    new_y = $position[:y] + y
		puts "The rover will land on #{new_x} #{new_y}"
	end
end

rover = Rover.new
input[0].chars.to_a.each do |user_command|
  rover.calculate_position(user_command)
end