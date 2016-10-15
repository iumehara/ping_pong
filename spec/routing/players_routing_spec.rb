require 'rails_helper'

RSpec.describe PlayersController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/tournaments/1/players').to route_to(
        'players#index', tournament_id: '1'
      )
    end

    it 'routes to #new' do
      expect(get: '/tournaments/1/players/new').to route_to(
        'players#new', tournament_id: '1'
      )
    end

    it 'routes to #show' do
      expect(get: '/tournaments/1/players/1').to route_to(
        'players#show', id: '1', tournament_id: '1'
      )
    end

    it 'routes to #edit' do
      expect(get: '/tournaments/1/players/1/edit').to route_to(
        'players#edit', id: '1', tournament_id: '1'
      )
    end

    it 'routes to #create' do
      expect(post: '/tournaments/1/players').to route_to(
        'players#create', tournament_id: '1'
      )
    end

    it 'routes to #update via PUT' do
      expect(put: '/tournaments/1/players/1').to route_to(
        'players#update', id: '1', tournament_id: '1'
      )
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/tournaments/1/players/1').to route_to(
        'players#update', id: '1', tournament_id: '1'
      )
    end

    it 'routes to #destroy' do
      expect(delete: '/tournaments/1/players/1').to route_to(
        'players#destroy', id: '1', tournament_id: '1'
      )
    end
  end
end
