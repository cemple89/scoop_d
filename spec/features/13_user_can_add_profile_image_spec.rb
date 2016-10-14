require 'spec_helper'
require 'rails_helper'
require 'factory_girl_rails'
require 'carrierwave/test/matchers'
require 'pry'

describe ImageUploader do
  include CarrierWave::Test::Matchers

  let(:user) { User.create(email: 'testemail@gmail.com', password: 'alsoscooped' ) }
  let(:user2) { User.create(email: 'testemail2@gmail.com', password: 'scooped') }
  let(:uploader) { ImageUploader.new(user, :image) }

  it 'User can see upload link if not added file' do
    visit '/'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log In'

    expect(page).to have_link('Add Image')
  end

  it 'User can upload file' do
    visit '/'
    fill_in 'Email', with: user2.email
    fill_in 'Password', with: user2.password
    click_button 'Log In'

    click_link('Add Image')

    attach_file('uploader-field', File.join(Rails.root, '/spec/features/images/doge.jpg'))
  end
end
