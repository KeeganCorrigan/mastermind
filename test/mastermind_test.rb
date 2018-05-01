require 'minitest/autorun'
require 'minitest/pride'
require './lib/mastermind'

class MastermindTest < Minitest::Test
  def test_mastermind_exists
    mastermind = Mastermind.new
    assert_instance_of(Mastermind, mastermind)
  end

  def test_the_introduction
    mastermind = Mastermind.new
    assert_instance_of(introduction, mastermind)
  end
end
