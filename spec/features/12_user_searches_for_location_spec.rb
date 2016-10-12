require 'rails_helper'
require 'factory_girl_rails'

feature 'Authenticated user searches for location' do
  scenario 'searches for location that exists' do
    user = FactoryGirl.create(:user)
    location = FactoryGirl.create(:location, user: user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log In')

    fill_in 'search', with: location.name
    click_button 'Search'
    expect(page).to have_content('Search Results')
    expect(page).to have_content(location.name)
  end

  scenario 'searches for location that does not exist' do
    user = FactoryGirl.create(:user)
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log In')

    fill_in 'search', with: 'Friendlys'
    click_button 'Search'
    expect(page).to have_content('Search Results')
    expect(page).to have_content('Sorry, your search yielded no locations. Please add the location below!')

  end
end
