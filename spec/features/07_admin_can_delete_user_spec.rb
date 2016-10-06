# frozen_string_literal: true
require 'rails_helper'

feature 'Admin can delete user' do
  let(:populate_db) do
    @user1 = FactoryGirl.create(:user, admin: true)
    @user2 = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:user)
    @location1 = FactoryGirl.create(:location)
    @location2 = FactoryGirl.create(:location)
    @review1 = FactoryGirl.create(:review, user: @user1, location: @location1)
    @review2 = FactoryGirl.create(:review, user: @user2, location: @location1)
  end

  scenario 'Admin can see a list of all users' do
    populate_db
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button('Log In')
    click_button('Users')

    expect(page).to have_content(@user1.email)
    expect(page).to have_content(@user2.email)
  end

  scenario 'Admin can delete user' do
    populate_db
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button('Log In')
    click_button('Users')
    click_button(@user2.email)

    expect(page).to_not have_content(@user2.email)
  end

  scenario 'Non-admin user cannot delete user' do
    populate_db
    visit '/'
    fill_in 'Email', with: @user2.email
    fill_in 'Password', with: @user2.password
    click_button('Log In')

    expect(page).to_not have_button('Users')
  end
end
