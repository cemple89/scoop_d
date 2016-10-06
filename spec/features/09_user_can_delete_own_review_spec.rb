# frozen_string_literal: true
require 'rails_helper'

feature 'User can delete own review' do

 let!(:user) do
   User.create(
     email: 'testemail@gmail.com',
     password: 'alsoscooped'
   )
 end

 let!(:user2) do
   User.create(
     email: 'testemail2@gmail.com',
     password: 'alsoscooped2'
   )
 end

 let!(:location) do
   Location.create(
     name: 'Pinkberry',
     address: 'Harvard Square',
     city: 'Cambridge',
     state: 'Massachussetts',
     zip_code: '02138'
   )
 end

 let!(:review) do
   Review.create(
     user_id: user.id,
     rating: 3,
     body: 'This was adequate.',
     flavor: 'Strawberry',
     location_id: location.id
   )
 end

 let!(:review2) do
   Review.create(
     user_id: user2.id,
     rating: 2,
     body: 'Awful',
     flavor: 'Vanilla',
     location_id: location.id
   )
 end

 scenario 'User can delete own review' do
   visit '/'
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button('Log In')
   click_link('Pinkberry')
   click_link(review.id)
   expect(page).to_not have_content(review.flavor)
 end

 scenario 'User cannot delete another user\'s review' do
   visit '/'
   fill_in 'Email', with: user.email
   fill_in 'Password', with: user.password
   click_button('Log In')
   click_link('Pinkberry')
   expect(page).to_not have_link(review2.id)
 end
end
