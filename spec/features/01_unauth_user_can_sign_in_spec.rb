require 'spec_helper'
require 'rails_helper'

feature "Unauthorized can login" do
  let(:user) do
    User.create(
      username: "test_user"
    )
  end

  scenario "User sees login button in header" do
    visit '/'
    expect(page).to have_link ("Login")
  end

  scenario "User can click login button and login" do
    visit '/'
    click_link ("Login")

    sign_in user
    expect(page).to have_content("test_user successfully signed in!")
  end

  scenario "User information displayed at top of index and location pages" do

  end

  scenario "Logged in User can log out from button in header" do

  end
end
