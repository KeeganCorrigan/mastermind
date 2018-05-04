require "pry"
# require './filename' the . represents root directory

player_guess = ["b", "b", "r", "b"]
computer_guess = ["b", "y", "y", "r"]

counter = 0

player_guess.each do |v|
  if computer_guess.include?(v)
    delete = computer_guess.index(v)
    computer_guess.delete_at(delete)
    counter += 1
  end
end

p counter


# counts = Hash.new 0
#
# computer_guess.each do |word|
#   counts[word] += 1
# end
#
# p counts
#
# counts_2 = Hash.new 0
#
# player_guess.each do |word|
#   counts_2[word] += 1
# end
#
# p counts_2
#
# (counts_2.keys & counts_1.keys).each do |k|
#   puts (counts_2[k] == counts_1[k] ? [k] : k)
#   color_amount << k
# end
#
# p color_amount
# (player_color_count_hash.keys & computer_color_count_hash.keys).each do |k|
#   puts ( player_color_count_hash[k] == computer_color_count_hash[k] ? [k] : k )
#   color_amount << k
# end


#
# computer_guess.each_with_index do |n, i|
#   counter = 0
#   if computer_guess

# computer_guess.each do |name|
#   unique_elements = 0
#   name
#   binding.pry
#   if player_guess.uniq == name
#     unique_elements += 1
#   end
#   p unique_elements
# end

#
# end
#
# p number_of_like_elements
#
# p number_of_like_elements.count(true)

# arr_1.each do |x|
#   first_array_position.at
#   if arr_2[0] == arr_1[0]
#     puts "you guessed right"
#   else
#     puts "you are wrong"
#   end
# end

# player_color_count_hash = Hash.new 0

# correct_guesses_and_positions =

# computer_guess.each_with_index do |color, i|
#   binding.pry
#   color == player_guess[i]
# end

# computer_guess.each_with_index do |color, i|
#   element_counter = 0
#   if color == player_guess[i]
#     element_counter += 1
#   end
#   p element_counter
# end
#
# p element_counter







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
