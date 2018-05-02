require "pry"
# require './filename' the . represents root directory

computer_guess = ["b", "b", "g", "y"]
player_guess = ["y", "g", "r", "r"]

# arr_1.each do |x|
#   first_array_position.at
#   if arr_2[0] == arr_1[0]
#     puts "you guessed right"
#   else
#     puts "you are wrong"
#   end
# end

# player_color_count_hash = Hash.new 0

correct_guesses_and_positions =

computer_guess.each_with_index do |color, i|
  color = player_guess[i]
end

  binding.pry

number_of_like_colors = computer_guess.map { |n| player_guess.uniq.include?(n) }.count(true)

p number_of_like_colors





# def color_counter (player, computer)
#   p player.uniq.include?(computer.uniq)
# end
#
# p arr_1.uniq(arr_2)
#
# arr_1.uniq
# arr_1.each do |color|
#   player_color_count_hash[color] += 1
# end
#
# p player_color_count_hash
#
# computer_color_count_hash = Hash.new 0
#
# arr_2.each do |color|
#   computer_color_count_hash[color] += 1
# end
#
# p computer_color_count_hash
#
# color_amount = []
#
# (player_color_count_hash.keys & computer_color_count_hash.keys).each do |k|
#   puts ( player_color_count_hash[k] == computer_color_count_hash[k] ? [k] : k )
#   color_amount << k
# end
#
# if color_amount.length == 0
#   "you have guessed none of the colors, good day"
# elsif
#   color_amount.length == 1
#   puts "you have guessed 1 of the colors"
# elsif
#   color_amount.length == 2
#   puts "you have guessed 2 of the colors"
# elsif
#   color_amount.length == 3
#   puts "you have guessed 3 of the colors"
# end
