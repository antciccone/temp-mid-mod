require 'rails_helper'


describe 'As a visitor' do
  context 'when I click create an account' do
    it 'I can am redirect to the new page' do

      visit users_path
      click_link "Sign Up"

      expect(current_path).to eq(new_user_path)
    end
  end

  it "I can make an account" do
    visit new_user_path
    save_and_open_page
    fill_in :Name, with: "Anthony"
    fill_in :Email, with: 'aciccone2014@gmail.com'
    fill_in :Password, with: "123"
    fill_in 'user[password_confirmation]', with: "123"
    click_on "Create Account"

    expect(current_path).to eq(links_path)
    expect(page).to have_content("You have created an account")
  end
end
