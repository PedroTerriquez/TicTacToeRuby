module TicTacToe
  class Board
    attr_reader :board
    def initialize
      @row = 0
      @board = [" 1 "," 2 "," 3 "," 4 "," 5 " ," 6 "," 7 "," 8 "," 9 "]
      create
    end

    def pick(position,player)
      raise StandardError, "DONT" unless @board[position] != " X " && @board[position] !=" O "
    rescue
      puts "\n\nARE U BLIND? ITS ALREADY OCCUPIED \n\n"
      return false
    else
      @board[position]= " #{player} "
      draw
    end

    def create
      draw
    end

  private
    def draw
      system('clear')
      @board.each do |square|
        print square
        @row += 1
        if @row >2
          puts ""
        @row = 0
       end
      end
    end

  end
end
