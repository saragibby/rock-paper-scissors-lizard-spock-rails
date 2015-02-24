module GamesHelper
  def selection_name(selection)
    Game::CHOICES[selection.to_sym][:name]
  end

  def get_result_desc(round)
    if round.tie?
      "It was a tie! No winner"
    else
      "WINNER is: #{round.winner.name} - #{selection_name(round.winner_selection)} #{round.winning_action} #{selection_name(round.loser_selection)}"
    end
  end
end
