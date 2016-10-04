require 'spec_helper'
require 'rails_helper'

feature "Unauthorized can login" do
  let(:user) do
    User.create(
      email: "test_user",
      password: "scooped"
    )
  end

  scenario "User sees login button in header" do
    visit '/'
    expect(page).to have_button ("Log In")
  end

  scenario "User can click login button and login" do
    visit '/'
    click_button ("Log In")

    sign_in user
    expect(page).to have_content("Signed in as #{user.email}")
  end

  scenario "User information displayed at top of index and location pages" do

  end

  scenario "Logged in User can log out from button in header" do

  end
end
