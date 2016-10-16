require 'spec_helper'

RSpec.describe 'Tournament page', type: :feature do
  it 'User visits the page and signs up' do
    tournament = Tournament.create(name: 'Fall 2016')
    visit "/tournaments/#{tournament.id}"

    expect(page).to have_text('Fall 2016')

    click_link 'Sign Up'

    expect(page).to have_text('Sign Up')

    fill_in 'Name', with: 'Amy'
    click_button 'Sign Up'

    expect(page).to have_text('Player was successfully created.')
    expect(page).to have_text('Amy')
  end
end
