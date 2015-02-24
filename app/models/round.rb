class Round < ActiveRecord::Base
  belongs_to :game

  delegate :player, :player2, to: :game

  before_save :set_computer_pick

  def tie?
    player1_selection == player2_selection
  end

  def winner
    player_win? ? player : player2
  end

  def loser
    !player_win? ? player : player2
  end

  def winner_selection
    player_win? ? player1_selection : player2_selection
  end

  def loser_selection
    !player_win? ? player1_selection : player2_selection
  end

  def winning_action
    Game::CHOICES[winner_selection.to_sym][:beats][loser_selection.to_sym]
  end

  private

    def set_computer_pick
      if player2_selection.nil?
        player2.pick
        self.player2_selection = player2.selection
      end
    end

    def player_win?
      Game::CHOICES[player1_selection.to_sym][:beats].keys.include? player2_selection.to_sym
    end
end
