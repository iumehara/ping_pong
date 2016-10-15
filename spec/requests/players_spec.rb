require 'rails_helper'

RSpec.describe 'Players', type: :request do
  describe 'GET /players' do
    it 'returns 200' do
      tournament = Tournament.create(name: 'Fall 2016')

      get tournament_players_path(tournament.id)

      expect(response).to have_http_status(200)
    end
  end
end
