module Validator
  def self.evaluate(str, dictionary)
    str_arr = str.delete(' ').split("")
    num = 0
    word_arr = Array.new

    str_arr.each_with_index do |i, index|
      word = str_arr[num..index].join('')
      if dictionary.include?(word)
        word_arr << word
        num = index + 1
      end
    end

    word_arr.join('').chars.count == str_arr.count
  end
end
