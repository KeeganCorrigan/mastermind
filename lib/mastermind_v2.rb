require "pry"
require "./lib/text"

class Mastermind
  def initialize
    text = Text.new
    @computer_color_selection = []
    @initial_player_input = ""
    @player_colors_guess_array = []
    @correct_guesses_and_positions = []
    @number_of_like_elements = []
    @guess_counter = 0
  end

  def computer_random_generator
    color_options = ["r", "g", "b", "y"]
    4.times do
      @computer_color_selection << color_options.sample
    end
  end

  def get_player_initial_input
    @initial_player_input = gets.chomp.downcase
  end

  def player_path_decider
    until @initial_player_input == "p"
      if @initial_player_input == "i"
        p instructions
      elsif @initial_player_input == "q"
        exit
      end
    get_player_initial_input
    end
  end

  def cheat_code
    @initial_player_input == "c"
    puts @computer_color_selection
  end

  def instructions
    "this is how you play the game"
  end

  def game_play_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def get_player_guess
    player_color_guess = gets.downcase.chomp
    exit if player_color_guess == "q"
    puts @computer_color_selection if player_color_guess == "c"
    @player_colors_guess_array = player_color_guess.split("")
  end

  def check_player_guess_for_validity
    until @player_colors_guess_array.length == @computer_color_selection.length
      if @player_colors_guess_array.length > @computer_color_selection.length
        puts "Too many colors!"
      elsif @player_colors_guess_array.length < @computer_color_selection.length
        puts "Not enough colors!"
      end
      get_player_guess
    end
  end

  def check_number_of_exact_elements
    exact_element_counter = 0
    @computer_color_selection.each_with_index do |color, i|
      if color == @player_colors_guess_array[i]
        exact_element_counter += 1
      end
    end
    exact_element_counter
  end

  def check_number_of_like_elements
    unique_element_counter = 0
    @player_colors_guess_array.each do |color|
      if @computer_color_selection.include?(color)
        delete_color = copmuter_guess.index(v)
        computer_guess.delete_at(delete)
        unique_element_counter += 1
      end
    end
    unique_element_counter
  end

  def guess_counter
    if @player_colors_guess_array != @computer_color_selection
      @guess_counter += 1
    end
    @guess_counter
  end

  def incorrect_guess_statement
    puts "#{@player_colors_guess_array.join("")} has #{check_number_of_like_elements} of the correct elements with #{check_number_of_exact_elements} in the correct positions. Number of guesses: #{@guess_counter}"
  end

  def win_state
    if @player_colors_guess_array == @computer_color_selection
      puts "You guessed correctly! It only took you... uh... #{@guess_counter} guesses."
      p "Do you want to (p)lay again or (q)uit?"
      get_player_initial_input
      player_path_decider
    end
  end
end

mastermind = Mastermind.new
text = Text.new

p text.intro
mastermind.player_path_decider
p mastermind.game_play_instructions
mastermind.computer_random_generator

loop do
  mastermind.get_player_guess
  mastermind.check_player_guess_for_validity
  mastermind.check_number_of_exact_elements
  mastermind.check_number_of_like_elements
  mastermind.guess_counter
  mastermind.incorrect_guess_statement
  mastermind.win_state
end

# prints that "c" is not the correct length
# mastermind.win_state asks player if they want to play but flow control is wonky and needs to be adjusted.
# create a reset guess counter method
