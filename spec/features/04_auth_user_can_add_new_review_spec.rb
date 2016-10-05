# frozen_string_literal: true
require 'rails_helper'

feature 'users can add reviews for locations' do
  let(:user) do
    User.create(
      email: 'test_user@gmail.com',
      password: 'scooped'
    )
  end
  scenario 'adds a review for a location successfully' do
    forge_ice_cream_bar = Location.create(
      name: 'Forge Ice Cream Bar',
      address: '626 Somerville Ave.',
      city: 'Somerville',
      state: 'MA',
      zip_code: '02143'
                                          )
    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password

    click_button 'Log In'
    visit location_path(forge_ice_cream_bar)
    click_link 'Add a Review'

    expect(page).to have_content 'Review Form for Forge Ice Cream Bar'

    choose 'five scoops'

    fill_in 'Extra Scoop', with: 'This is a raving review!'
    fill_in 'Flavor', with: 'Rocky Road'
    click_button 'Add Review'

    expect(page).to have_content 'Review added successfully'
    expect(page).to have_content forge_ice_cream_bar.name
    expect(page).to have_content 5
    expect(page).to have_content 'Rocky Road'
    expect(page).to have_content 'This is a raving review!'
  end

  scenario 'adds a review for a location unsuccessfully' do
    visit '/'

    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log In'
    forge_ice_cream_bar = Location.create(
      name: 'Forge Ice Cream Bar',
      address: '626 Somerville Ave.',
      city: 'Somerville',
      state: 'MA',
      zip_code: '02143'
                                          )

    visit location_path(forge_ice_cream_bar)

    click_link 'Add a Review'
    expect(page).to have_content 'Review Form for Forge Ice Cream Bar'
    choose('five scoops')

    click_button 'Add Review'

    expect(page).to have_content 'Flavor can\'t be blank'
  end
end
