require 'spec_helper'
require 'rails_helper'

feature "Unauthorized can signup" do
  let(:user) do
    User.create(
      email: "test_user",
      password: "scooped"
    )
  end

  scenario "User sees signup button in header" do
    visit '/'
    expect(page).to have_link ("Sign up")
  end

  scenario "User can click signup button" do
    visit '/'
    click_link ("Sign up")

    expect(page).to have_field("Email")
    expect(page).to have_field("Password")
    expect(page).to have_field("Password confirmation")
  end

  scenario "User enters information and signs up" do
    visit '/'
    click_link ("Sign up")
  end

  scenario "Logged in User can log out from button in header" do

  end
end
