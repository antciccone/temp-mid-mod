require 'rails_helper'


describe 'As a visitor' do
  context 'when I click create an account' do
    it 'I can am redirect to the new page' do

      visit users_path
      click_link "Sign Up"

      expect(current_path).to eq(new_user_path)
    end
  end

  it "I can make an account an see a flash message" do
    visit new_user_path

    fill_in 'user[name]', with: "Anthony"
    fill_in 'user[email]', with: 'aciccone2014@gmail.com'
    fill_in 'user[password]', with: "123"
    fill_in 'user[password_confirmation]', with: "123"

    click_on "Create Account"

    expect(current_path).to eq(login_path)
    expect(page).to have_content("You have created an account")
  end
end
