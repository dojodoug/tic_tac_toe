
def display
  puts "   1   2   3 "
    ("A".."C").each.with_index(1) do |r, c|
      row = r + "    |   |"
    puts row
    puts "  -----------" unless c == 3
  end
end

display

def get_user_input
  puts "To start the game please choose a location."
  puts "Location selections should be one of the following: (A1, A2, A3, B1, B2, B3, C1, C2, or C3)."
  input = gets.chomp.upcase
end

puts "You chose #{get_user_input}."
