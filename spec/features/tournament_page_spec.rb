require 'spec_helper'

RSpec.describe 'Tournament page', type: :feature do
  it 'User visits the page' do
    tournament = Tournament.create(name: 'Fall 2016')
    visit "/tournaments/#{tournament.id}"

    expect(page).to have_text('Fall 2016')
  end
end
