require 'rails_helper'

RSpec.describe TeamGenerator do
  describe 'make_pairs' do
    it 'creates teams' do
      tournament = Tournament.create(name: 'Fall 2016')
      Player.create(name: 'Amy', tournament_id: tournament.id)
      Player.create(name: 'Bob', tournament_id: tournament.id)
      Player.create(name: 'Cam', tournament_id: tournament.id)
      Player.create(name: 'Dave', tournament_id: tournament.id)
      Player.create(name: 'Evan', tournament_id: tournament.id)
      Player.create(name: 'Fred', tournament_id: tournament.id)

      TeamGenerator.make_pairs(tournament)

      expect(tournament.teams.count).to eq(3)
      reloaded_tournament = Tournament.find(tournament.id)
      expect(reloaded_tournament.status).to eq('teams_created')
    end

    it 'does not create teams if tournament already has at least one team' do
      tournament = Tournament.create(name: 'Fall 2016')
      amy = Player.create(name: 'Amy', tournament_id: tournament.id)
      bob = Player.create(name: 'Bob', tournament_id: tournament.id)
      Player.create(name: 'Cam', tournament_id: tournament.id)
      Player.create(name: 'Dave', tournament_id: tournament.id)
      Team.create(
        name: 'test',
        tournament_id: tournament.id,
        player_one_id: amy.id,
        player_two_id: bob.id
      )

      TeamGenerator.make_pairs(tournament)

      expect(tournament.teams.count).to eq(1)
    end
  end
end
