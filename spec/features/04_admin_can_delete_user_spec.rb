require "rails_helper"

feature "Admin can delete user" do
  let(:user) do
    User.create(
      email: "sophieheller1@gmail.com",
      password: "scooped",
      admin: true
    )
  end

  let!(:user2) do
    User.create(
      email: "testemail@gmail.com",
      password: "alsoscooped"
    )
  end

  scenario "Admin can see a list of all users" do
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log In")
    click_button("Users")

    expect(page).to have_content(user.email)
    expect(page).to have_content(user2.email)
  end

  scenario "Admin can delete user" do
    visit '/'
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button("Log In")
    click_button("Users")
    click_button(user2.email)

    expect(page).to_not have_content(user2.email)
  end

  scenario "Non-admin user cannot delete user" do
    visit '/'
    fill_in "Email", with: user2.email
    fill_in "Password", with: user2.password
    click_button("Log In")

    expect(page).to_not have_button("Users")
  end


end
