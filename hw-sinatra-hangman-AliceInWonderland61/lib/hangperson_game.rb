class HangpersonGame

  # add the necessary class methods, attributes, etc. here
  # to make the tests in spec/hangperson_game_spec.rb pass.

  # Get a word from remote "random word" service

  # def initialize()
  # end
  
  def initialize(word)
    @word = word
    @guess= ""
=begin
            is the letter a nil? 
            is it empty?
            not 
=end

    @wrong_guesses=""
    @guesses=""
    #this will return 
  end
#make a function for each of the @ varaiables 
def word()
  return @word
end

def guesses()
  return @guesses
end

def wrong_guesses()
  return @wrong_guesses
end

def guess(letter)
  raise ArgumentError, "Invalid Input" if letter.nil? || letter.empty? || letter=~ /[^a-zA-Z]/
  return false if @guesses.downcase.include?(letter.downcase) || @wrong_guesses.downcase.include?(letter.downcase)
  if @word.downcase.include?(letter.downcase)
    @guesses+=letter
    true
  else
    @wrong_guesses+=letter
    true
  end
end

def word_with_guesses
  @word.chars.map { |l| @guesses.include?(l) ? l : '-' }.join
end

def check_win_or_lose
  return :lose if @wrong_guesses.length>=7
  return :win if word_with_guesses ==@word
  :play
end

  # You can test it by running $ bundle exec irb -I. -r app.rb
  # And then in the irb: irb(main):001:0> HangpersonGame.get_random_word
  #  => "cooking"   <-- some random word
  def self.get_random_word
    require 'uri'
    require 'net/http'
    uri = URI('http://randomword.saasbook.info/RandomWord')
    Net::HTTP.new('randomword.saasbook.info').start { |http|
      return http.post(uri, "").body
    }
  end

end
