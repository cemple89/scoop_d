require "rails_helper"

feature "Admin can delete review" do
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

  let!(:location) do
    Location.create(
      name: "Pinkberry",
      address: "Harvard Square",
      city: "Cambridge",
      state: "Massachussetts",
      zip_code: "02138"
    )
  end

  let!(:review) do
    Review.create(
      user_id: user2.id,
      rating: 3,
      body: "This was adequate.",
      flavor: "Strawberry"
    )
  end

  scenario "Admin can delete review" do
    visit '/'
    sign_in_as_user
    visit '/locations/#{location.id}/#{review.id}' # change if routes different
    click_button(review.id)  # make button id "review.id"

    expect(page).to_not have_content(review.flavor)
  end

  scenario "Non-admin user cannot delete review" do
    visit '/'
    sign_in_as_user2
    visit '/locations/#{location.id}/#{review.id}'

    expect(page).to_not have_button(review.id)
  end


end
