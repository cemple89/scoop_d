# frozen_string_literal: true
require 'rails_helper'

describe 'User can ' do

  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:location_1) { create(:location, user: user_1) }
  let!(:review_1) { create(:review, user: user_1, location: location_1) }
  let!(:review_2) { create(:review, user: user_2, location: location_1) }

  feature 'delete own review' do

   scenario 'User can delete own review' do
     visit '/'
     fill_in 'Email', with: user_1.email
     fill_in 'Password', with: user_1.password
     click_button('Log In')
     visit '/locations/#{location_1.id}'
     click_link('Delete ' + review_1.flavor + ' review')
     expect(page).to_not have_content(review_1.flavor)
   end

   scenario 'User cannot delete another user\'s review' do
     visit '/'
     fill_in 'Email', with: user_1.email
     fill_in 'Password', with: user_1.password
     click_button('Log In')
     visit '/locations/#{location_1.id}'
     expect(page).to_not have_link('Delete ' + review_2.flavor + ' review')
   end
  end
end
