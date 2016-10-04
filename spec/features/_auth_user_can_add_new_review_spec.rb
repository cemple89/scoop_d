require 'rails_helper'

feature "users can add reviews for locations" do
  scenario "adds a review for a location successfully" do
    forge_ice_cream_bar = Location.create(name: 'Forge Ice Cream Bar', address: '626 Somerville Ave.', city: 'Somerville', state: 'MA', zip_code: '02143')

    visit location_path(forge_ice_cream_bar)

    click_link "Add a Review"

    expect(page).to have_content "Review Form for Forge Ice Cream Bar"


    choose("five scoops")
    fill_in "Extra Scoop", with: "This is a raving review!"
    fill_in "Flavor", with: "Rocky Road"
    click_button "Add Review"

    expect(page).to have_content "Review added successfully"
    expect(page).to have_content forge_ice_cream_bar.name
    expect(page).to have_content 5
    expect(page).to have_content forge_ice_cream_bar.flavor
    expect(page).to have_content "This is a raving review!"
  end

  scenario "adds a review for a location unsuccessfully" do
    forge_ice_cream_bar = Location.create(name: 'Forge Ice Cream Bar', address: '626 Somerville Ave.', city: 'Somerville', state: 'MA', zip_code: '02143')

    visit location_path(forge_ice_cream_bar)

    click_link "Add a Review"
    expect(page).to have_content "Review Form for Forge Ice Cream Bar"


    click_button "Add Review"

    expect(page).to have_content "Body can't be blank"
  end
end
