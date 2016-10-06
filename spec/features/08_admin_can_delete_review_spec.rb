# frozen_string_literal: true
require 'rails_helper'

feature 'Admin can delete review' do
  let(:user) do
    User.create(
      email: 'sophieheller1@gmail.com',
      password: 'scooped',
      admin: true
    )
  end

  let!(:user2) do
    User.create(
      email: 'testemail@gmail.com',
      password: 'alsoscooped'
    )
  end

  let!(:user3) do
    User.create(
      email: 'testemail34@gmail.com',
      password: 'alsoscooped34'
    )
  end

  let!(:location) do
    Location.create(
      name: 'Pinkberry',
      address: 'Harvard Square',
      city: 'Cambridge',
      state: 'Massachussetts',
      zip_code: '02138'
    )
  end

  let!(:review) do
    Review.create(
      user_id: user2.id,
      rating: 3,
      body: 'This was adequate.',
      flavor: 'Strawberry',
      location_id: location.id
    )
  end

  scenario 'Admin can delete review' do
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log In')
    click_link('Pinkberry')
    click_link('Delete ' + review.flavor + ' review')
    expect(page).to_not have_content(review.flavor)
  end

  scenario 'Non-admin user cannot delete review' do
    visit '/'
    fill_in 'Email', with: user3.email
    fill_in 'Password', with: user3.password
    click_button('Log In')
    click_link('Pinkberry')
    expect(page).to_not have_link('Delete ' + review.flavor + ' review')
  end
end
