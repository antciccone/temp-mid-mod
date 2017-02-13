require 'rails_helper'


describe 'As a user' do
  context 'when I sign up' do
    it "I can then login" do
      visit new_user_path

      fill_in :Name, with: "Anthony"
      fill_in :Email, with: 'aciccone2014@gmail.com'
      fill_in :Password, with: "123"
      fill_in 'user[password_confirmation]', with: "123"
      click_on "Create Account"

      click_on "Sign In"


    end
  end
end
