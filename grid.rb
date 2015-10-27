require 'byebug'

class Grid

  def initialize
    @selection_array = ["A1", "A2", "A3", "B1", "B2", "B3", "C1", "C2", "C3"]
    @player_array = []
    @board_array = [[" "," "," "],
                    [" "," "," "],
                    [" "," "," "]]
  end

  ### DISPLAY THE GRID ###

  def board_template
    puts " BOARD TEMPLATE"
    print "\n"
    puts "    1    2    3 "
    print "\n"
    puts "A   A1 | A2 | A3"
    puts "   --------------"
    puts "B   B1 | B2 | B3"
    puts "   --------------"
    puts "C   C1 | C2 | C3"
    print "\n"
  end

  # board_template

  def display_board
    (0..2).each do |r|
      print " "
      (0..2).each do |c|
        print @board_array[r][c]
        print " | " unless c == 2
      end
      print "\n"
      print " ---------\n" unless r == 2
    end
    print "\n"
  end

  # display_board

  ### GET USER SELECTION ###

  def user_input
    puts "Enter a selection."
    puts "Location selections should be one of the following: (A1, A2, A3, B1, B2, B3, C1, C2, or C3)."
    gets.chomp.upcase
  end

  ### CHECK USER SELECTION ###

  def row_pick(input)
    hash = { "A" => 0, "B" => 1, "C" => 2 }
    hash[input[0]]
  end

  def col_pick(input)
    input[1].to_i - 1
  end

  def update_board(input, letter)
    @board_array[row_pick(input)][col_pick(input)] = letter
  end

  def update_letter(letter)
    if letter == "X"
      letter = "O"
    else
      letter = "X"
    end
  end

  def selection_error(input)
    @selection_array.include?(input)
  end

  def same_selection(input)
    @player_array.include?(input)
  end

  def play
    puts "Player 1 enter your name: "
    player1 = gets.chomp

    puts "Player 2 enter your name: "
    player2 = gets.chomp

    letter = "X"
    while @board_array.any? {|sub_array| sub_array.include?(" ")} do

        # puts "Enter a position!"
        input = user_input
        update_board(input, letter) #MODIFY THIS METHOD
        display_board

      if !selection_error(input)
        puts "DOES NOT COMPUTE! That is not a selection option."
        puts "Please try again."
        redo
      elsif same_selection(input)
        puts "No double dipping...You have already made that selection."
        puts "Please try again."
        redo
      else
        @player_array << input
        print "\n"
        print @player_array
        print "\n"
      end
      letter = update_letter(letter)
    end

    puts "Game Over"
  end

end
