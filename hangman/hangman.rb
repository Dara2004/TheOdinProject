class Hangman

  def initialize
    dict = "dictionary.txt"
    file = File.open(dict, 'r')
      file.readlines.sample(1).each do |word|
        @word = word.chomp.downcase
        # p @word
      end
    @arr = @word.split("")
    @answer = Array.new(@word.length, "_")
    @displayed_word = @answer.join
    @misses = []
    start
  end

  def start
    puts "Welcome to the game Hangman!"
    puts @displayed_word
  end

  def guess
    until win? || @misses.length == 9
      puts "You have #{9 - @misses.length} guesses left. Enter a letter: "
      print "> "
      @guess = gets.chomp.downcase
      @arr.each_with_index do |chr, idx|
        if @arr.include?(@guess)
          index = @arr.each_index.select {|id| @arr[id] == @guess} #captures the same letter which appears more than once
          index.each {|id| @answer[id] = @guess}  #replace arr @ index with letter(s)
          puts "Word: #{@answer.join}"
          puts "Guess: #{@guess}"
          puts "Misses: #{@misses.join(",")}"
          break

        else
          puts "Word: #{@answer.join}"
          if @misses.include?(@guess) == false
            puts "Guess: #{@guess}"
            @misses.push(@guess)
            puts "Misses: #{@misses.join(",")}"
            break
          else
            puts "Letter has been guessed. Try another"
            break
          end
        end
      end
    end
    if win?
      puts "You won!"
    else
      puts "Out of guess. The answer is \"#{@word}\"."
    end
  end

  def win?
    @answer.join == @word
  end
end

my_hangman = Hangman.new
my_hangman.guess
