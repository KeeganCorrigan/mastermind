require 'minitest/autorun'
require 'minitest/pride'
require './lib/game_logic'
require 'pry'

class GameLogicTest < Minitest::Test
  def test_game_logic_exists
    mastermind = GameLogic.new
    assert_instance_of(GameLogic, mastermind)
  end

  def test_computer_random_generator_class
    mastermind = GameLogic.new
    assert Integer, mastermind.computer_random_generator.class
  end

  def test_invalid_guess?
    skip
    mastermind = GameLogic.new
    assert true, mastermind.invalid_guess?
    # assert true, mastermind.invalid_guess?(player_color_guess)
    # player_color_guess = "rygb"
    assert false, mastermind.invalid_guess?(player_color_guess)
  end

  def test_did_player_win?
    skip
    mastermind = GameLogic.new
    @computer_sequence = ["r", "g", "b", "y"]
    @player_guess = ["r", "y", "b", "y"]
    assert_equal true, mastermind.did_player_win?
  end

  def test_exact_elements_class
    mastermind = GameLogic.new
    mastermind.computer_sequence = ["r", "g", "b", "y"]
    mastermind.player_guess = ["r", "g", "g", "y"]
    assert_equal 3, mastermind.exact_elements
  end

  def test_guess_counter
    skip
    mastermind = GameLogic.new
    assert Integer, mastermind.guess_counter.class
  end

  def reset_computer_input
    skip
    mastermind = GameLogic.new
    @computer_sequence = ["r", "b", "g", "y"]
    assert @computer_sequence.empty?, mastermind.reset_computer_input
  end
end
