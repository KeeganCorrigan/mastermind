require "pry"
require "./lib/text"

class Mastermind
  def initialize
    @computer_sequence = []
    @player_guess = []
    @guess_counter = 0
  end

  def start_time
    @time_start = Time.new.to_i
  end

  def computer_random_generator
    if @computer_sequence == []
      color_options = ["r", "g", "b", "y"]
      start_time
      4.times do
        @computer_sequence << color_options.sample
      end
    end
  end

  def introductory_text
   puts "Welcome to MASTERMIND\n Would you like to (p)lay, (r)ead the instructions, or (q)uit?"
  end

  def player_path_decider
    introductory_text
    initial_player_input = gets.chomp.downcase
    if initial_player_input == "p"
      return
    elsif initial_player_input == "r"
      instructions
      player_path_decider
    elsif initial_player_input == "q"
      exit
    end
  end

  def instructions
    puts "The computer will generate a random sequence of (r)ed, (g)reen, (b)lue, and (y)ellow. You will make guesses in the format: rygb. You can quit at any time by pressing (q) or typing quit!"
  end

  def game_play_instructions
    puts "I have generated a beginner sequence with four elements made up of: (r)ed, (g)reen, (b)lue, and (y)ellow. Use (q)uit at any time to end the game."
  end

  def get_player_guess
    game_play_instructions
    player_color_guess = gets.downcase.chomp
    if player_color_guess == "q"
      exit
    elsif player_color_guess == "c"
      puts @computer_sequence.join
      get_player_guess
    elsif invalid_guess?(player_color_guess)
      get_player_guess
    else
      @player_guess = player_color_guess.split("")
    end
  end

  def invalid_guess?(player_color_guess)
    if player_color_guess.length == @computer_sequence.length
      return false
    elsif player_color_guess.length > @computer_sequence.length
      puts "Too many colors!"
      return true
    elsif player_color_guess.length < @computer_sequence.length
      puts "Not enough colors!"
      return true
    end
  end

  def exact_elements
    exact_element_counter = 0
    @computer_sequence.each_with_index do |color, i|
      exact_element_counter += 1 if color == @player_guess[i]
    end
    exact_element_counter
  end

  def like_elements
    like_element_counter = 0
    cloned_computer_sequence = @computer_sequence.clone
    @player_guess.each do |color|
      if cloned_computer_sequence.include?(color)
        delete_color = cloned_computer_sequence.index(color)
        cloned_computer_sequence.delete_at(delete_color)
        like_element_counter += 1
      end
    end
    like_element_counter
  end

  def guess_counter
    if did_player_win? == false
      @guess_counter += 1
    end
    @guess_counter
  end

  def incorrect_guess_statement
    puts "#{@player_guess.join("")} has #{like_elements} of the correct elements with #{exact_elements} in the correct positions. Number of guesses: #{@guess_counter}."
  end

  def did_player_win?
    @player_guess == @computer_sequence
  end

  def time_spent_playing
    total_time_played = Time.now.to_i - @time_start
    puts "It took you #{total_time_played / 60} minutes and #{total_time_played % 60} seconds to finish!"
  end

  def win_state_text
    puts "You guessed correctly! It only took you... uh... #{@guess_counter} guesses."
  end

  def play_again_text
    puts "Do you want to (p)lay again or (q)uit?"
  end

  def reset_computer_input
    @computer_sequence = []
  end

  def win_state
    if did_player_win? == true
    @guess_counter += 1
    win_state_text
    time_spent_playing
    @guess_counter = 0
    play_again_text
    loop do
      play_again_or_quit = gets.chomp.downcase
      if play_again_or_quit == "p"
        break
      elsif play_again_or_quit == "q"
        exit
      end
    end
    reset_computer_input
    puts `clear`
  end
end

mastermind = Mastermind.new

# puts text.intro
mastermind.player_path_decider

loop do
  mastermind.computer_random_generator
  mastermind.get_player_guess
  mastermind.guess_counter
  mastermind.incorrect_guess_statement
  mastermind.win_state
end

end
