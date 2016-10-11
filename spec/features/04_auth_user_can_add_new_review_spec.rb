# frozen_string_literal: true
require 'rails_helper'

describe 'User can' do

  let!(:user_1) { create(:user) }
  let!(:location_1) { create(:location) }

  feature 'add reviews for locations' do

    scenario 'adds a review for a location successfully' do
      visit '/'

      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password

      click_button 'Log In'
      visit location_path(location_1)
      click_link 'Add a Review'

      expect(page).to have_content "Review Form for #{location_1.name}"

      choose 'five scoops'

      fill_in 'Extra Scoop', with: 'This is a raving review!'
      fill_in 'Flavor', with: 'Rocky Road'
      click_button 'Add Review'

      expect(page).to have_content 'Review added successfully'
      expect(page).to have_content location_1.name
      expect(page).to have_content 'five scoops'
      expect(page).to have_content 'Rocky Road'
      expect(page).to have_content 'This is a raving review!'
    end

    scenario 'adds a review for a location unsuccessfully' do
      visit '/'

      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'

      visit location_path(location_1)

      click_link 'Add a Review'
      expect(page).to have_content 'Review Form for ' + location_1.name
      choose('five scoops')

      click_button 'Add Review'

      expect(page).to have_content 'Flavor can\'t be blank'
    end
  end
end
