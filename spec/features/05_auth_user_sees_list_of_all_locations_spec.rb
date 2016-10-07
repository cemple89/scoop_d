# frozen_string_literal: true
require 'rails_helper'

feature 'users sees a list of locations' do
  before(:each) do
    @user1 = FactoryGirl.create(:user)
    @user2 = FactoryGirl.create(:user)
    @admin_user = FactoryGirl.create(:user, admin: true)
    @location1 = FactoryGirl.create(:location)
    @location2 = FactoryGirl.create(:location)
    @review1 = FactoryGirl.create(:review, user: @user1, location: @location1)
  end

  scenario 'sees a list of locations and link for new location' do
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    visit locations_path

    expect(page).to have_content @location1.name
    expect(page).to have_link @location2.name

    click_link 'Add New Location'

    expect(page).to have_content 'New Location Form'
  end

  scenario 'clicks link and is taken to show page for given restaurant' do
    visit '/'
    fill_in 'Email', with: @user1.email
    fill_in 'Password', with: @user1.password
    click_button 'Log In'
    visit root_path

    click_link @location2.name

    expect(page).to have_content @location2.name
    expect(page).to have_content @location2.address
    expect(page).to have_content @location2.city
    expect(page).to have_content @location2.state
    expect(page).to have_content @location2.zip_code
  end
end
