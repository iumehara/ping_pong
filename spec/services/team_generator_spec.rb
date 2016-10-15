require 'rails_helper'

RSpec.describe TeamGenerator do
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
  end
end
