require "pry"
require "./lib/text"

class Mastermind
  attr_reader
  def initialize
    text = Text.new
    @computer_color_selection = []
    @initial_player_input = ""
    @player_colors_guess_array = []
    @correct_guesses_and_positions = []
    @number_of_like_elements = []
    @element_counter = 0
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
      if @initial_player_input == "c"
        cheat_code
      elsif @initial_player_input == "i"
        p game_play_instructions
      elsif @initial_player_input == "q"
        quit_game
      end
    get_player_initial_input
    end
  end


  def cheat_code
    @initial_player_input == "c"
    puts @computer_color_selection
  end

  def quit_game
    puts "So... this is how it ends."
    exit
  end

  def game_play_instructions
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def get_player_guess
    player_color_guess = gets.downcase.chomp
    exit if player_color_guess == "q"
    p @computer_color_selection  if player_color_guess == "c"
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
    @computer_color_selection.each_with_index do |color, i|
      if color == @player_colors_guess_array[i]
        @element_counter += 1
      end
    end

    def guess_counter
      if @player_colors_guess_array != @copmuter_color_selection
        @guess_counter += 1
      end
      binding.pry
    end

    def win_state
      if @player_colors_guess_array == @computer_color_selection
        puts "You guessed correctly! It only took you... uh... #{@guess_counter} guesses."
      end
    end
  end

#   def check_number_of_exact_elements
#     @number_of_like_elements = @computer_color_selection.map { |n| @players_colors_guess_array.uniq.include?(n) }.count(true)
#   end
# end

mastermind = Mastermind.new
text = Text.new

mastermind.computer_random_generator
p text.intro
mastermind.player_path_decider

# mastermind.get_player_initial_input

# if mastermind.check_number_of_exact_elements == 4
# break
loop do
  mastermind.game_play_instructions
  mastermind.get_player_guess
  mastermind.check_player_guess_for_validity
  mastermind.check_number_of_exact_elements
  # mastermind.check_number_of_like_elements
  mastermind.guess_counter
  # if mastermind.win_state
  # mastermind.check_number_of_exact_elements
  end
end
