# frozen_string_literal: true
require 'rails_helper'
describe 'Admin can ' do

  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:admin_user) { create(:user, admin: true) }
  let!(:location_1) { create(:location, user: user_1) }
  let!(:review_1) { create(:review, user: user_1, location: location_1) }
  let!(:review_2) { create(:review, user: user_2, location: location_1) }

  feature 'delete review' do

    scenario 'Admin can delete review' do
      visit '/'
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      click_button('Log In')
      visit '/locations/#{location1.id}'
      click_link('Delete ' + review_2.flavor + ' review')
      expect(page).to_not have_content(review_2.flavor)
    end

    scenario 'Non-admin user cannot delete review' do
      visit '/'
      fill_in 'Email', with: user_2.email
      fill_in 'Password', with: user_2.password
      click_button('Log In')
      visit '/locations/#{location1.id}'
      expect(page).to_not have_link('Delete ' + review_1.flavor + ' review')
    end
  end
end
