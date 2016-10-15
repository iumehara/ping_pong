require 'rails_helper'

RSpec.describe 'Services', type: :request do
  describe 'POST /tournaments/1/generate_teams' do
    it 'returns 302 redirect to tournament show page' do
      tournament = Tournament.create(name: 'Fall 2016')
      Player.create(name: 'Amy', tournament_id: 1)
      Player.create(name: 'Bob', tournament_id: 1)
      Player.create(name: 'Cam', tournament_id: 1)
      Player.create(name: 'Dave', tournament_id: 1)
      Player.create(name: 'Evan', tournament_id: 1)
      Player.create(name: 'Fred', tournament_id: 1)

      post tournament_generate_teams_path(tournament.id)

      expect(response).to have_http_status(302)
    end
  end
end
