require 'rails_helper'

describe 'As a user' do
  context 'when I am signed in' do
    it "I can now sign out" do

      visit new_user_path

      fill_in :Email, with: 'test@test.com'
      fill_in :Password, with: "hi"
      fill_in 'user[password_confirmation]', with: "hi"
      click_on "Create Account"

      click_on "Sign Out"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sign In")
    end
  end
end
