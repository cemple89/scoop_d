require 'rails_helper'

feature "Authorized user can be designated as admin after login" do
  scenario "Designated admin logs in" do
    user = User.create(
      email: "sophieheller1@gmail.com",
      password: "scooped",
      admin: true
    )
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log In")

    expect(user.admin).to be true
  end

  scenario "Undesignated user logs in, not registered as admin" do
    user = User.create(
      email: "testemail@gmail.com",
      password: "testtest",
    )
    visit '/'
    fill_in "Email", with: "testemail@gmail.com"
    fill_in "Password", with: "testtest"
    click_button("Log In")

    expect(user.admin).to be false
  end
end
