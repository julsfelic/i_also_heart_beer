require 'rails_helper'

RSpec.feature 'User can create an account' do
  scenario 'they see their personal page with a welcome message' do
    username = 'Julian'
    password = 'password'

    visit root_path
    click_link 'Register'
    fill_in 'Username', with: username
    fill_in 'Password', with: password
    click_button 'Register'

    user = User.last

    expect(current_path).to eq(user_path(user))
    within('.success') do
      expect(page).to have_content('Welcome to I Heart Beer!')
    end
    expect(page).to have_content('Julian')
  end
end
