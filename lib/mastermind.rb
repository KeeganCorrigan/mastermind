require "pry"
require "./text"

class Mastermind
  def initialize
    text = Text.new
    @computer_color_selection = []
    @initial_player_input = ""
  end

  def computer_random_generator
    color_options = ["r", "g", "b", "y"]
    4.times do
      @computer_color_selection << color_options.sample
    end
  end

  def introduction
    p text.intro
  end

  def get_player_input
    @initial_player_input = gets.chomp.downcase
  end
end

Mastermind.new

computer_random_generator
introduction





# require "pry"
#
# #class Mastermind
# #  def introduction
#
# computer_color_selection = []
# player_colors_guess_array = []
#
# color_options = ["r", "g", "b", "y"]
#
# 4.times do
#     computer_color_selection << color_options.sample
# end
#
# computer_color_values
# computer_index_values
#
# puts "Welcome to MASTERMIND \n
#   Would you like to (p)lay, read the (i)nstructions, or (q)uit?"
#
# initial_player_input = gets.chomp.downcase
#
# initial_player_input.downcase
#
#   if initial_player_input == "p"
#     puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
#     puts "What's your guess?"
#     player_colors_guess = gets.downcase.chomp
#     player_colors_guess_array = player_colors_guess.split("")
#       until player_colors_guess_array.length == computer_color_selection.length
#         puts "blah blah"
#       elsif player_colors_guess_array.length > computer_color_selection.length
#         puts "Too many colors!"
#       elsif player_colors_guess_array.length < computer_color_selection.length
#         puts "Not enough colors!"
#       end
#       until player_colors_guess_array == computer_color_selection
#         player_colors_guess_array.each_with_index do |pi, pv|
#
#
#
#
#
#   elsif initial_player_input == "i"
#     puts "You will guess a sequence of colors (for example, yyrb). If you guess the color and sequence correctly, the game ends. To make the game easier, you will be informed about how many colors you guessed correctly and how many color positions are correct."
#   elsif initial_player_input == "c"
#     puts computer_color_selection
#   elsif initial_player_input == "q"
# end
# #  end
# #  introduction
# #end
