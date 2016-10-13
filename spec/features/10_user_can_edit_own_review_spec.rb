# frozen_string_literal: true
require 'rails_helper'
describe 'User can ' do

  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:location_1) { create(:location, user: user_1) }
  let!(:review_1) { create(:review, user: user_1, location: location_1) }
  let!(:review_2) { create(:review, user: user_2, location: location_1) }

  feature 'edit own review' do

   scenario 'User can edit own review' do
     visit '/'
     fill_in 'Email', with: user_1.email
     fill_in 'Password', with: user_1.password
     click_button('Log In')
     visit '/locations/' + location_1.id.to_s
     click_link('Edit ' + review_1.flavor + ' review')
     fill_in "Flavor", with: "Chocolate"
     click_button("Add Review")
     expect(page).to have_content("Chocolate")
   end

   scenario 'User cannot dedit another user\'s review' do
     visit '/'
     fill_in 'Email', with: user_1.email
     fill_in 'Password', with: user_1.password
     click_button('Log In')
     visit '/locations/' + location_1.id.to_s
     expect(page).to_not have_link('Edit ' + review_2.flavor + ' review')
   end
  end
end
