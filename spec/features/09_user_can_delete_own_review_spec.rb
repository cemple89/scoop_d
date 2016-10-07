# frozen_string_literal: true
require 'rails_helper'

feature 'User can delete own review' do
  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:user, admin: true)
    @location1 = FactoryGirl.create(:location)
    @location2 = FactoryGirl.create(:location)
    @review1 = FactoryGirl.create(:review, user: @user1, location: @location1)
    @review2 = FactoryGirl.create(:review, user: @user2, location: @location1)
  end

 scenario 'User can delete own review' do
   visit '/'
   fill_in 'Email', with: @user1.email
   fill_in 'Password', with: @user1.password
   click_button('Log In')
   click_link(@location1.name)
   click_link('Delete ' + @review1.flavor + ' review')
   expect(page).to_not have_content(@review1.flavor)
 end

 scenario 'User cannot delete another user\'s review' do
   visit '/'
   fill_in 'Email', with: @user1.email
   fill_in 'Password', with: @user1.password
   click_button('Log In')
   click_link(@location1.name)
   expect(page).to_not have_link('Delete ' + @review2.flavor + ' review')
 end
end
