class ServicesController < ApplicationController
  def generate_teams
    @tournament = Tournament.find(params[:tournament_id])
    TeamGenerator.make_pairs(@tournament)
    redirect_to(
      tournament_path(@tournament.id),
      notice: 'teams were successfully created'
    )
  end
end
