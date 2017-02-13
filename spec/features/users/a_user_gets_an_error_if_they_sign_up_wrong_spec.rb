require 'rails_helper'


describe "As a user" do
  context 'when i visit users new path' do
    it 'an my passwords dont match I get an error' do
      visit new_user_path

      visit new_user_path
      save_and_open_page
      fill_in :Name, with: "Anthony"
      fill_in :Email, with: 'aciccone2014@gmail.com'
      fill_in :Password, with: "123"
      fill_in 'user[password_confirmation]', with: "13"
      click_on "Create Account"

      expect(page).to have_content("Username and password do not match")
    end
  end
end
