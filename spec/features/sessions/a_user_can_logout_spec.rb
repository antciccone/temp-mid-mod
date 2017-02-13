require 'rails_helper'


describe 'As a signed in user' do
  context 'when I visit the links index' do
    it "I can click on Sign out to be logged out" do
      User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))

      visit login_path

      fill_in :Email, with: 'test@test.com'
      fill_in :Password, with: "test"
      click_on "Log In!"

      expect(page).to have_content("Sign Out")
      click_on "Sign Out"

      expect(current_path).to eq(login_path)
      expect(page).to have_content("Sign In")
    end
  end
end
