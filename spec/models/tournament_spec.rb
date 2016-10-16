require 'rails_helper'

RSpec.describe Tournament, type: :model do
  describe 'callbacks' do
    it 'sets default status to "signup"' do
      tournament = Tournament.create(name: 'Fall 2016')

      expect(tournament).to be_valid
      expect(tournament.status).to eq('signup')
    end
  end
end
