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

  # def player_path_decider
  #   until @initial_player_input == "p"
  #     if @initial_player_input == "c"
  #       cheat_code
  #       get_player_initial_input
  #     elsif @initial_player_input == "i"
  #       display_instructions
  #       get_player_initial_input
  #     elsif @initial_player_input == "q"
  #       quit_game
  #       break
# =>    end
# =>  get_player_initial_input
  #   end
  # end

  def cheat_code
    @initial_player_input == "c"
    puts @computer_color_selection
  end

  def quit_game
    puts "So... this is how it ends."
  end

  def game_play_instructions
    "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  # def initiate_game_play
  #   puts game_play_instructions
  #   get_player_guess
  #   test_player_guess
  # end

  def get_player_guess
    player_color_guess = gets.downcase.chomp
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
      binding.pry
    end

    def guess_counter
      if @player_colors_guess_array != @copmuter_color_selection
        @guess_counter += 1
      end
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
# mastermind.get_player_initial_input
loop do
  # if mastermind.check_number_of_exact_elements == 4
  # break
  mastermind.get_player_guess
  mastermind.check_player_guess_for_validity
  mastermind.check_number_of_exact_elements
  mastermind.check_number_of_like_elements
  mastermind.guess_counter
  binding.pry
  # mastermind.check_number_of_exact_elements
end
end
