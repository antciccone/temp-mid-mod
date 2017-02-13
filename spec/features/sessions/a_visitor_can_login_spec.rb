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

      fill_in :Email, with: 'aciccone2014@gmail.com'
      fill_in :Password, with: "123"

      click_on "Log In!"

      expect(page).to have_content('You have successfully logged in!')
      expect(current_path).to eq(links_path)
      expect(page).to have_content("Sign Out")
    end
  end

  it "and I enter the wrong password I get a flash message" do
    User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))

    visit login_path

    fill_in :Email, with: 'aciccone2014@gmail.com'
    fill_in :Password, with: "123"

    click_on "Log In!"

    expect(page).to have_content("Password and user name do not match")
  end
end
