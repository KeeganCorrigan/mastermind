require "pry"
require "./lib/text"

class Mastermind
  def initialize
    text = Text.new
    @computer_color_selection = []
    @initial_player_input = ""
    @player_colors_guess = []
    @correct_guesses_and_positions = []
    @number_of_like_elements = []
    @guess_counter = 0
  end

  def computer_random_generator
    if @computer_color_selection == []
      color_options = ["r", "g", "b", "y"]
      4.times do
        @computer_color_selection << color_options.sample
      end
    end
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

  def get_player_initial_input
    @initial_player_input = gets.chomp.downcase
  end

  def instructions
    "this is how you play the game"
  end

  def game_play_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def get_player_guess
    player_color_guess = ""
    game_play_instructions
    player_color_guess = gets.downcase.chomp
    exit if player_color_guess == "q"
    if player_color_guess == "c"
      p @computer_color_selection.join
      # get_player_guess
    end
    @player_colors_guess = player_color_guess.split("")
  end

  def check_player_guess_for_validity
    until @player_colors_guess.length == @computer_color_selection.length || @player_color_guess == "c"
      if @player_colors_guess.length > @computer_color_selection.length && @player_colors_guess =! "c"
        puts "Too many colors!"
      elsif @player_colors_guess.length < @computer_color_selection.length && @player_colors_guess =! "c"
        puts "Not enough colors!"
      end
      get_player_guess
    end
  end

  def check_number_of_exact_elements
    exact_element_counter = 0
    @computer_color_selection.each_with_index do |color, i|
      if color == @player_colors_guess[i]
        exact_element_counter += 1
      end
    end
    exact_element_counter
  end

  def check_number_of_like_elements
    unique_element_counter = 0
    cloned_computer_color_selection = @computer_color_selection.clone
    @player_colors_guess.each do |color|
      if cloned_computer_color_selection.include?(color)
        delete_color = cloned_computer_color_selection.index(color)
        cloned_computer_color_selection.delete_at(delete_color)
        unique_element_counter += 1
      end
    end
    unique_element_counter
  end

  def guess_counter
    if @player_colors_guess != @computer_color_selection
      @guess_counter += 1
    end
    @guess_counter
  end

  def incorrect_guess_statement
    clear_screen
    puts "#{@player_colors_guess.join("")} has #{check_number_of_like_elements} of the correct elements with #{check_number_of_exact_elements} in the correct positions. Number of guesses: #{@guess_counter}"
  end

  def win_state_text
    "You guessed correctly! It only took you... uh... #{@guess_counter} guesses."
  end

  def play_again_text
    "Do you want to (p)lay again or (q)uit?"
  end

  def clear_screen
    puts `clear`
  end

  def win_state
    if @player_colors_guess == @computer_color_selection
      @guess_counter += 1
      p win_state_text
      @guess_counter = 0
      p play_again_text
      loop do
        get_player_initial_input
        break if @initial_player_input == "p"
        exit if @initial_player_input == "q"
      end
      reset_computer_input
    end
  end

  def reset_computer_input
    @computer_color_selection = []
  end
end

mastermind = Mastermind.new
text = Text.new

p text.intro
mastermind.player_path_decider

loop do
  mastermind.computer_random_generator
  p mastermind.game_play_instructions
  mastermind.get_player_guess
  mastermind.check_player_guess_for_validity
  mastermind.check_number_of_exact_elements
  mastermind.check_number_of_like_elements
  mastermind.guess_counter
  mastermind.incorrect_guess_statement
  mastermind.win_state
end

# create a reset guess counter method
