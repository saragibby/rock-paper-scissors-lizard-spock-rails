class ComputerPlayer
  attr_reader :selection

  def name; "Computer"; end

  def pick
    @selection = Game::CHOICES.keys.sample.to_s
  end
end
