# frozen_string_literal: true
require 'rails_helper'

describe 'Admin can' do

  let!(:user_1) { create(:user) }
  let!(:user_2) { create(:user) }
  let!(:admin_user) { create(:user, admin: true) }

  feature 'delete user' do

    scenario 'Admin can see a list of all users' do
      visit '/'
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      click_button('Log In')
      click_button('Users')

      expect(page).to have_content(user_1.email)
      expect(page).to have_content(user_2.email)
    end

    scenario 'Admin can delete user' do
      visit '/'
      fill_in 'Email', with: admin_user.email
      fill_in 'Password', with: admin_user.password
      click_button('Log In')
      click_button('Users')
      click_button(user_2.email)

      expect(page).to_not have_content(user_2.email)
    end

    scenario 'Non-admin user cannot delete user' do
      visit '/'
      fill_in 'Email', with: user_2.email
      fill_in 'Password', with: user_2.password
      click_button('Log In')

      expect(page).to_not have_button('Users')
    end
  end
end
