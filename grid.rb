
def display
  puts "   1   2   3 "
    ("A".."C").each.with_index(1) do |r, c|
      row = r + "    |   |"
    puts row
    puts "  -----------" unless c == 3
  end
end

display
