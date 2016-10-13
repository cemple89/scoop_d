# frozen_string_literal: true
require 'rails_helper'

feature 'User receives email about reviewed item' do

  before(:each) do
    ActionMailer::Base.delivery_method = :test
    ActionMailer::Base.perform_deliveries = true
    ActionMailer::Base.deliveries = []
  end

  let!(:user) do
    User.create(
      email: 'testemail@gmail.com',
      password: 'alsoscooped'
    )
  end

  let!(:user2) do
    User.create(
      email: 'testemail2@gmail.com',
      password: 'alsoscooped2'
    )
  end

  let!(:location) do
    Location.create(
      name: 'Pinkberry',
      address: 'Harvard Square',
      city: 'Cambridge',
      state: 'Massachussetts',
      zip_code: '02138',
      user: user
    )
  end

  let!(:review) do
    Review.create(
      user_id: user.id,
      rating: 3,
      body: 'This was adequate.',
      flavor: 'Strawberry',
      location_id: location.id
    )
  end

  let!(:review2) do
    Review.create(
      user_id: user2.id,
      rating: 2,
      body: 'Awful',
      flavor: 'Vanilla',
      location_id: location.id
    )
  end

  scenario 'Actionmailer sends emails to correct recipients' do
    visit '/'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button('Log In')

    click_link('Pinkberry')

    click_link 'Add a Review'

    expect(page).to have_content 'Review Form for Pinkberry'

    choose 'five scoops'

    fill_in 'Extra Scoop', with: 'This is a raving review!'
    fill_in 'Flavor', with: 'Rocky Road'
    click_button 'Add Review'

    expect(page).to have_content 'Review added successfully'
    expect(ActionMailer::Base.deliveries.count).to eq(1)
    expect(ActionMailer::Base.deliveries.first.to).to eq([user2.email])
    expect(ActionMailer::Base.deliveries.first.subject).to eq('New Scoop from Scoop\'d')
    expect(ActionMailer::Base.deliveries.first.from).to eq(['scoopdmailer@gmail.com'])
  end


end
