  class Mastermind
    def initialize
      @colors = ["re", "gr", "pu", "ye", "or", "bl", "wh", "br"]
      p @secret_colors = @colors.sample(4)  #["gr", "pu", "ye", "or"]
      @board = Array.new(10) {Array.new(4, ' ')}  #{" ", " ", " ", " "}
      @active = 0  #["gr", "pu", "ye", "or"]
      @row_cntr = 0
      start
    end

    def start
      puts "Welcome to the game Mastermind!"
      display_board
    end

    def display_board
      puts "Choose 4 colors from:
      red: 're'
      green: 'gr'
      purple: 'pu'
      yellow: 'ye'
      orange: 'or'
      black: 'bl'
      white: 'wh'
      brown: 'br'"
      puts "Don't forget to add space between the 4 colors for example: 're gr pu ye' "
      @col_cntr = 0
      @idx_cntr = 0
      @secret_colors.each_with_index do |col, idx|
        @board[@active-1].each_with_index do |col1, idx1|
          if col == col1 && idx == idx1
            @col_cntr += 1
            @idx_cntr += 1
          elsif col == col1
            @col_cntr += 1
          end
        end
      end
      puts "-----------------"
      puts "#{@win? @secret_colors[0] : '??'} | #{@win? @secret_colors[1] : '??'} | #{@win? @secret_colors[2] : '??'} | #{@win? @secret_colors[3] : '??'}"
      puts "-------------"
      puts "#{@board[9][0]} | #{@board[9][1]} | #{@board[9][2]} | #{@board[9][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[8][0]} | #{@board[8][1]} | #{@board[8][2]} | #{@board[8][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[7][0]} | #{@board[7][1]} | #{@board[7][2]} | #{@board[7][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[6][0]} | #{@board[6][1]} | #{@board[6][2]} | #{@board[6][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[5][0]} | #{@board[5][1]} | #{@board[5][2]} | #{@board[5][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[4][0]} | #{@board[4][1]} | #{@board[4][2]} | #{@board[4][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[3][0]} | #{@board[3][1]} | #{@board[3][2]} | #{@board[3][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} | #{@board[2][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} | #{@board[1][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      puts "#{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} | #{@board[0][3]} >> White: #{@col_cntr}, red: #{@idx_cntr}"
      puts "-------------"
      reset
    end

    def reset
      # puts "a"
      @col_cntr = 0
      @idx_cntr = 0
    end

    def go
      until @board[@active-1] == @secret_colors || @row_cntr == 9
        @color = gets.chomp.split
        @board[@active] = @color
        @active += 1
        @row_cntr += 1
        win?
      end
    end

    def win?
      if @board[@active-1] == @secret_colors
        @win = true
        puts "Congratulation, you won!"  #this should be displayed in the end
      elsif @row_cntr == 9
        @win = true
        puts "You lose. Play again."
      else
        @win = false
      end
      display_board
    end
  end

    my_mastermind = Mastermind.new

    my_mastermind.go
