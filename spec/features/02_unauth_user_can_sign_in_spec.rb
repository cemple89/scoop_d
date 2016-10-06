# frozen_string_literal: true
require 'spec_helper'
require 'rails_helper'

feature 'Unauthorized can login' do

  let(:populate_db) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:user)
    @location1 = FactoryGirl.create(:location)
    @location2 = FactoryGirl.create(:location)
    @review1 = FactoryGirl.create(:review, user: @user1, location: @location1)
  end

  scenario 'User sees login button in header' do
    visit '/'
    expect(page).to have_button 'Log In'
  end

  scenario 'User can click login button and login' do
    populate_db
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'

    expect(page).to have_content("Signed in as #{@user1.email}")
  end

  scenario 'Logged in User can log out from button in header' do
    populate_db
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    click_button 'Sign Out'

    expect(page).to have_button 'Log In'
  end

  scenario 'User enters incorrect password and cannot login' do
    populate_db
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: 'scoop'
    click_button 'Log In'

    expect(page).to_not have_content("Signed in as #{@user1.email}")
  end

end
