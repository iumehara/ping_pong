class PlayersController < ApplicationController
  before_action :set_player, only: [:edit, :update, :destroy]
  before_action :set_tournament

  def index
    @players = Player.all
  end

  def new
    @player = Player.new
  end

  def edit
  end

  def create
    @player = Player.new(player_params)

    @player.tournament_id = @tournament.id
    if @player.save
      redirect_to(
        tournament_players_path(@tournament.id),
        notice: 'Player was successfully created.'
      )
    else
      render :new
    end
  end

  def update
    if @player.update(player_params)
      redirect_to(
        tournament_players_path(@tournament.id),
        notice: 'Player was successfully updated.'
      )
    else
      render :edit
    end
  end

  def destroy
    @player.destroy
    redirect_to(
      tournament_players_path(@tournament.id),
      notice: 'Player was successfully destroyed.'
    )
  end

  private

  def set_player
    @player = Player.find(params[:id])
  end

  def set_tournament
    @tournament = Tournament.find(params[:tournament_id])
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
