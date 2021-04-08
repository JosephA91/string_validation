require 'minitest/autorun'
require_relative 'validator'

class ValidatorTest < Minitest::Test
  def test_words_with_spaces_are_in_dictionary
    str = 'this is a test'
    dictionary = ['this', 'is', 'a', 'test']
    assert Validator.evaluate(str, dictionary)
  end

  def test_words_with_no_spaces_are_in_dictionary
    str = 'thisisatest'
    dictionary = ['this', 'is', 'a', 'test']
    assert Validator.evaluate(str, dictionary)
  end

  def test_string_words_are_not_in_dictionary
    str = 'this is a test x'
    dictionary = ['this', 'is', 'a', 'test']
    refute Validator.evaluate(str, dictionary)
  end

  def test_dictionary_words_are_not_in_string
    str = 'this is a test'
    dictionary = ['this', 'is', 'a', 'test', 'x']
    assert Validator.evaluate(str, dictionary)
  end

  def test_special_characters_in_string_and_dictionary
    str = 'this is a test s#*t'
    dictionary = ['this', 'is', 'a', 'test', 's#*t']
    assert Validator.evaluate(str, dictionary)
  end

  def test_special_characters_in_string_only
    str = 'this is a test s#*t'
    dictionary = ['this', 'is', 'a', 'test']
    refute Validator.evaluate(str, dictionary)
  end

  def test_special_characters_in_dictionary_only
    str = 'this is a test'
    dictionary = ['this', 'is', 'a', 'test', 's#*t']
    assert Validator.evaluate(str, dictionary)
  end

  # Test cases from Leetcode
  def test_one_leetcode
    str = 'leetcode'
    dictionary = ["leet","code"]
    assert Validator.evaluate(str, dictionary)
  end

  def test_two_leetcode
    str = 'applepenapple'
    dictionary = ["apple","pen"]
    assert Validator.evaluate(str, dictionary)
  end

  def test_three_leetcode
    str = 'catsandog'
    dictionary = ["cats","dog","sand","and","cat"]
    refute Validator.evaluate(str, dictionary)
  end
end
