# frozen_string_literal: true
require 'rails_helper'
require 'spec_helper'

feature 'authorized user can add a location' do
  let(:user) do
    User.create(
      email: 'test_user@gmail.com',
      password: 'scooped'
    )
  end

  scenario 'user adds new location successfully' do
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit new_location_path
    expect(page).to have_content 'New Location Form'

    fill_in 'Name', with: 'JP Lick\'s'
    fill_in 'Address', with: '25 Massachusetts Ave.'
    fill_in 'City', with: 'Cambridge'
    fill_in 'State', with: 'Massachusetts'
    fill_in 'Zip Code', with: '02111'
    select('Harvard', from: 'Neighborhood')
    fill_in 'Phone', with: '617-555-1234'
    fill_in 'url', with: 'www.jplicks.com'

    click_button 'Add Location'

    expect(page).to have_content 'Location added successfully'
    expect(page).to have_content 'JP Lick\'s'
  end

  scenario 'visitor does not provide proper information for a location' do
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    click_link 'Add New Location'
    click_button 'Add Location'
    expect(page).to have_content 'Name can\'t be blank'
    expect(page).to have_content 'Address can\'t be blank'
    expect(page).to have_content 'City can\'t be blank'
    expect(page).to have_content 'State can\'t be blank'
    expect(page).to have_content 'Zip code can\'t be blank'
    expect(page).to have_content (
    'Zip code is the wrong length (should be 5 characters)'
    )
    expect(page).to have_content 'Zip code is not a number'
  end
end
