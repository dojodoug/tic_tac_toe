
@base_array = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
@player_array = []
@board_array = [[" "," "," "],
                [" "," "," "],
                [" "," "," "]]

### DISPLAY THE GRID ###

def display
  puts "   1   2   3 "
    ("A".."C").each.with_index(1) do |r, c|
      row = r + "    |   |"
    puts row
    puts "  -----------" unless c == 3
  end
end

display

### GET USER SELECTION ###

def user_input
  puts "To start the game please choose a location."
  puts "Location selections should be one of the following: (A1, A2, A3, B1, B2, B3, C1, C2, or C3)."
  gets.chomp.upcase
end

### CHECK USER SELECTION ###

def selection_error(input)
  @base_array.include?(input)
end

def same_selection(input)
  @player_array.include?(input)
end

while @board_array.any? {|sub_array| sub_array.include?(" ")} do
  input = user_input

  if !selection_error(input)
    puts "That is not a selection option."
    puts "Please try again."
    redo
  elsif same_selection(input)
    puts "No double dipping...You have already made that selection."
    puts "Please try again."
    redo
  else
    @player_array << input
    puts
    print @player_array
    puts
  end
end
