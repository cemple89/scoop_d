# frozen_string_literal: true
require 'rails_helper'
describe 'User sees list of all locations' do

  let!(:user_1) { create(:user) }
  let!(:location_1) { create(:location, user: user_1) }
  let!(:location_2) { create(:location, user: user_1) }

  feature 'users sees a list of locations' do

    scenario 'sees a list of locations and link for new location' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'
      visit locations_path

      expect(page).to have_content location_1.name
      expect(page).to have_link location_2.name

      click_link 'Add New Location'

      expect(page).to have_content 'New Location Form'
    end

    scenario 'clicks link and is taken to show page for given restaurant' do
      visit '/'
      fill_in 'Email', with: user_1.email
      fill_in 'Password', with: user_1.password
      click_button 'Log In'
      visit root_path

      click_link location_2.name

      expect(page).to have_content location_2.name
      expect(page).to have_content location_2.address
      expect(page).to have_content location_2.city
      expect(page).to have_content location_2.state
      expect(page).to have_content location_2.zip_code
    end
  end
end
