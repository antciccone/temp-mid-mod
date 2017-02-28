require 'rails_helper'

describe 'As a user' do
  context 'when I am make an account' do
    it "and I enter the wrong password" do

      user = User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))

      visit login_path

      fill_in 'email', with: 'test@test.com'
      fill_in 'password', with: "hi"
      click_on "Submit"

      expect(page).to have_content("Email and password do not match")
      expect(current_path).to eq(login_path)
    end
  end
end
