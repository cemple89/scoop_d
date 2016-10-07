# frozen_string_literal: true
require 'rails_helper'

feature 'Admin can delete user' do
  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:user, admin: true)
    @location1 = FactoryGirl.create(:location)
    @location2 = FactoryGirl.create(:location)
    @review1 = FactoryGirl.create(:review, user: @user1, location: @location1)
  end

  scenario 'Admin can see a list of all users' do
    visit '/'
    fill_in 'Email', with: @admin_user.email
    fill_in 'Password', with: @admin_user.password
    click_button('Log In')
    click_button('Users')

    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.email)
  end

  scenario 'Admin can delete user' do
    visit '/'
    fill_in 'Email', with: @admin_user.email
    fill_in 'Password', with: @admin_user.password
    click_button('Log In')
    click_button('Users')
    click_button(@user2.email)

    expect(page).to_not have_content(@user2.email)
  end

  scenario 'Non-admin user cannot delete user' do
    visit '/'
    fill_in 'Email', with: @user2.email
    fill_in 'Password', with: @user2.password
    click_button('Log In')

    expect(page).to_not have_button('Users')
  end
end
