require 'rails_helper'

describe 'As a user' do
  context 'when I sign up' do
    it "I am logged in a the current user" do

      visit new_user_path

      fill_in :Email, with: 'test@test.com'
      fill_in :Password, with: "hi"
      fill_in 'user[password_confirmation]', with: "hi"
      click_on "Create Account"

      expect(page).to have_content('You have successfully logged in!')
      expect(current_path).to eq(root_path)
      expect(page).to have_content("Sign Out")
    end
  end
end
