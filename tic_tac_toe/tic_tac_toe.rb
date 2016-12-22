class TicTacToe
  attr_accessor :player

  def initialize(player1_name, player2_name)
    @player1 = Player.new(player1_name, "X")
    @player2 = Player.new(player2_name, "O")
    @active = @player1
    @board = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    @counter = 0
    start
  end

  def start
    puts "Welcome to the game Tic Tac Toe!"
    display_board
  end

  def display_board
    puts "#{@board[0]} | #{@board[1]} | #{@board[2]}"
    puts "---------"
    puts "#{@board[3]} | #{@board[4]} | #{@board[5]}"
    puts "---------"
    puts "#{@board[6]} | #{@board[7]} | #{@board[8]}"
    # @board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end


  def move
    until win? || tie?
      puts "Player #{@active.name}, choose your move from 1 to 9: "
      position = gets.to_i
      if (1..9).include?(position) && @board[position-1] != "X" && @board[position-1] != "O"
        @board[position-1] = @active.char
        @active == @player1 ? @active = @player2 : @active = @player1
        @counter += 1
      else
        puts "Invalid move. Choose again"
        move
      end
      display_board
    end
    if win? && @active == @player1
      puts "#{@player2.name}, you won!"
    elsif win? && @active == @player2
      puts "#{@player1.name}, you won!"
    else
      puts "It's a tie!"
    end
  end

  class Player
    attr_accessor :name, :char
    def initialize(name, char)
      @name = name
      @char = char
    end
  end

  def win?
  		@winning_positions = [
  		#Horizontal
  		[0, 1, 2], [3, 4, 5], [6, 7, 8],
  		#Vertical
  		[0, 3, 6], [1, 4, 7],[2, 5, 8],
  		#Diagonal
  		[0, 4, 8], [2, 4, 6]
  	]
  	@winning_positions.each do |num|
  		first, second, third = num
  		return true if @board[first] == 'X' && @board[second] == 'X' && @board[third] == 'X'
  		return true if @board[first] == 'O' && @board[second] == 'O' && @board[third] == 'O'
  	end
  	return false
  end

  def tie?
  	return true if @counter == 9
  	return false
  end
end

my_tictactoe = TicTacToe.new("Dara", "Bryan")
my_tictactoe.move
