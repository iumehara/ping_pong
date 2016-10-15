require 'rails_helper'

RSpec.describe 'Players', type: :request do
  describe 'GET /tournaments/1/players' do
    it 'returns 200' do
      tournament = Tournament.create(name: 'Fall 2016')

      get tournament_players_path(tournament.id)

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments/1/players/new' do
    it 'returns 200' do
      tournament = Tournament.create(name: 'Fall 2016')

      get new_tournament_player_path(tournament.id)

      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /tournaments/1/players/1/edit' do
    it 'returns 200' do
      tournament = Tournament.create(name: 'Fall 2016')
      player = Player.create(name: 'Amy', tournament_id: tournament.id)

      get edit_tournament_player_path(tournament_id: tournament.id, id: player.id)

      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /tournaments/1/players' do
    it 'returns 302 redirect to players index page' do
      tournament = Tournament.create(name: 'Fall 2016')
      post_json = { player: { name: 'amy' } }

      post tournament_players_path(tournament.id), post_json

      expect(response).to have_http_status(302)
    end
  end

  describe 'PUT /tournaments/1/players/1' do
    it 'returns 302 redirect to players index page' do
      tournament = Tournament.create(name: 'Fall 2016')
      player = Player.create(name: 'Amy', tournament_id: tournament.id)
      put_json = { player: { id: player.id, name: 'Bob' } }

      put tournament_player_path(tournament_id: tournament.id, id: player.id), put_json

      expect(response).to have_http_status(302)
    end
  end

  describe 'DELETE tournaments/1/players/1' do
    it 'returns 302 redirect to players index page' do
      tournament = Tournament.create(name: 'Fall 2016')
      player = Player.create(name: 'Amy', tournament_id: tournament.id)

      delete tournament_player_path(tournament_id: tournament.id, id: player.id)

      expect(response).to have_http_status(302)
    end
  end
end
