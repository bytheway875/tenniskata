module Tennis
  
	class Game
		attr_accessor :player1, :player2

    def initialize
      @player1 = Player.new
      @player2 = Player.new

      @player1.opponent = @player2
      @player2.opponent = @player1

    end

    def wins_ball(player)
      if player == 1
        @player1.record_won_ball!
      elsif player == 2
        @player2.record_won_ball!
      end

    end


	end

	class Player
    attr_accessor :points, :opponent

		def initialize
      @points = 0
    end

    def record_won_ball!
      @points += 1
    end

    def score
      case @points
      when 0
        "love"
      when 1
        "fifteen"
      when 2
        "thirty"
      when 3..10
        if self.points == self.opponent.points
          "deuce"
        elsif self.points == self.opponent.points + 1
          "advantage"
        elsif self.points == self.opponent.points + 2
          "winner"
        else
          "forty"
        end
      end
    end
	end
end