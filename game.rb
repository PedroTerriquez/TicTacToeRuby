require 'pry'
module TicTacToe
  class Game
    def initialize
      board = Board.new
      player1 = Player.new("X")
      player2 = Player.new("O")
      @player, @finish = 0,0
      @correctposition = 0..8 #Array start at 0
      play(board,player1,player2)
    end

    def play(board,player1,player2)
      while @finish < 9 
        if @player.even? ? turn(board,player1) : turn(board,player2)
        end
      end
    end

    def turn(board,player)
      puts "Pick a position for #{player.symbol} with numbers (0-9)"
      position = validate(gets.chomp)
      turn(board,player) unless board.pick(position,player.symbol)
      @player += 1
      if winner?board
        @finish = 9
        puts "WINNER IS #{winner?board}"
      end
    end

    def validate(value)
      position = Integer(value)-1
      if @correctposition.include?position
        return position
      end
    rescue
      puts "Not a number"
    end

    def winner?(b)
      if(b.board[0]==b.board[1] && b.board[0] == b.board[2]) then b.board[0]
      elsif (b.board[0]==b.board[3] && b.board[0] == b.board[6]) then b.board[0]
      elsif (b.board[0]==b.board[4] && b.board[0] == b.board[8]) then b.board[0]
      elsif (b.board[1]==b.board[4] && b.board[1] == b.board[7]) then b.board[1]
      elsif (b.board[2]==b.board[4] && b.board[2] == b.board[6]) then b.board[2]
      elsif (b.board[2]==b.board[5] && b.board[2] == b.board[8]) then b.board[2]
      elsif (b.board[3]==b.board[4] && b.board[3] == b.board[5]) then b.board[3]
      elsif (b.board[6]==b.board[7] && b.board[6] == b.board[8]) then b.board[6]
      else false
      end
    end
  end
end
