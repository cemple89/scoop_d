require 'rails_helper'

feature 'users sees a list of locations' do
  let(:user) do
    User.create(
      email: 'test_user@gmail.com',
      password: 'scooped'
    )
  end
  scenario 'sees a list of locations and link for new location' do
    forge_ice_cream_bar = Location.create
    (name: 'Forge Ice Cream Bar', address: '626 Somerville Ave.',
     city: 'Somerville', state: 'MA', zip_code: '02143')
    toscaninis = Location.create
    (name: 'Toscanini\'s', address: '25 Main Street',
     city: 'Cambridge', state: 'MA', zip_code: '02139', neighborhood: 'Central')

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit locations_path

    expect(page).to have_content 'Forge Ice Cream Bar'
    expect(page).to have_link 'Toscanini\'s'

    click_link 'Add New Location'

    expect(page).to have_content 'New Location Form'
  end
  scenario 'clicks link and is taken to show page for given restaurant' do
    toscaninis = Location.create
    (name: 'Toscanini\'s', address: '25 Main Street',
    city: 'Cambridge', state: 'MA', zip_code: '02139', neighborhood: 'Central')

    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    visit root_path

    click_link 'Toscanini\'s'

    expect(page).to have_content toscaninis.name
    expect(page).to have_content toscaninis.address
    expect(page).to have_content toscaninis.city
    expect(page).to have_content toscaninis.state
    expect(page).to have_content toscaninis.zip_code
    expect(page).to have_content toscaninis.neighborhood
  end
end
