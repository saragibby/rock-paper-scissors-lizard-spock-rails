class Game < ActiveRecord::Base
  MAX_ROUNDS = 3
  CHOICES = { r:  { name: 'rock', beats: { l: 'crushes', sc: 'crushes' } },
              p:  { name: 'paper', beats: { r: 'covers', sp: 'disproves' } },
              sc: { name: 'scissors', beats: { l: 'decapitates', p: 'cuts' } },
              l:  { name: 'lizard', beats: { p: 'eats', sp: 'poisons'} },
              sp: { name: 'spock', beats: { r: 'vapourises', sc: 'smashes' } } }

  belongs_to :player
  has_many :rounds

  def player2
    @player2 ||= ComputerPlayer.new
  end

  def round_number
    rounds.count + 1
  end

  def new_round(player_selection)
    Round.create(player_selection)
  end

  def player_wins
    rounds.select{ |r| !r.tie? && r.winner == player }
  end

  def player2_wins
    rounds.select{ |r| !r.tie? && r.winner == player2 }
  end

  def champion
    if player_wins == player2_wins
      "TIE!!!"
    else
      player_wins.count > player2_wins.count ? player.name : player2.name
    end
  end
end
