# require 'spec_helper'
# require 'rails_helper'
# require 'factory_girl_rails'
# require 'capybara/rspec'
#
# describe "Up and down votes", js: true do
#
#   let!(:user_1) { create(:user) }
#   let!(:user_2) { create(:user) }
#   let!(:location_1) { create(:location, user: user_1) }
#   let!(:review_1) { create(:review, user: user_1, location: location_1) }
#   let!(:review_2) { create(:review, user: user_2, location: location_1) }
#
#   it 'User can upvote a review they like' do
#     visit '/'
#     fill_in 'Email', with: user_2.email
#     fill_in 'Password', with: user_2.password
#     click_button 'Log In'
#
#     click_link(location_1.name)
#
#     (find_by_id('js-upvote-1')).click
#
#     expect(page).to have_content("1 found this review helpful")
#   end
#
#   it 'User can upload file' do
#
#   end
#
# end
