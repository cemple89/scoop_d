# frozen_string_literal: true
require 'rails_helper'
describe 'Admin users' do

  feature 'can designate users as admins' do
    scenario 'Designated admin logs in' do
      user = FactoryGirl.create(:user, admin: true)
      visit '/'
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button('Log In')

      expect(user.admin).to be true
    end

    scenario 'Undesignated user logs in, not registered as admin' do
      user = FactoryGirl.create(:user)
      visit '/'
      fill_in 'Email', with: 'testemail@gmail.com'
      fill_in 'Password', with: 'testtest'
      click_button('Log In')

      expect(user.admin).to be false
    end
  end
end
