class GamesController < ApplicationController
  def create
    @name = params[:name]
    if @name.present?
      @player = Player.find_or_create_by(name: @name)
      @game = @player.games.create
    else
      render :index
    end
  end

  def update
    @game = Game.find(params[:id])
    @round = @game.rounds.create(player1_selection: params[:selection])
  end
end
