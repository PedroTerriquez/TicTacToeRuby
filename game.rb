require 'pry'
module TicTacToe
  class Game
    def initialize
      b = Board.new
      p1 = Player.new("X")
      p2 = Player.new("O")
      @turn = 0
      @finish = 0
      play(b,p1,p2)
    end

    def play(b,p1,p2)
      while @finish < 9 
        if @turn.even?
          puts "Pick a position for X"
          position = Integer(gets.chomp) - 1
          redo unless b.pick(position,p1.symbol) 
          @turn = 1
          @finish += 1
        elsif @turn.odd?
          puts "Pick a position for O"
          position = Integer(gets.chomp) -1
          redo unless b.pick(position,p2.symbol)
          @turn = 0
          @finish += 1
        end
        if winner?b
          @finish = 9
          puts "WINNER IS #{winner?b}"
        end
      end
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
