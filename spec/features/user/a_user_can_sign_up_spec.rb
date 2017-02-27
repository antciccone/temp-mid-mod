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

    fill_in 'user[email]', with: 'aciccone2014@gmail.com'
    fill_in 'user[password]', with: "123"
    fill_in 'user[password_confirmation]', with: "123"

    click_on "Create Account"

    expect(current_path).to eq(root_path)
  end

  it "I can not use the same email twice" do

    user = User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))

    visit new_user_path

    fill_in 'user[email]', with: 'test@test.com'
    fill_in 'user[password]', with: "123"
    fill_in 'user[password_confirmation]', with: "123"

    click_on "Create Account"

    expect(current_path).to eq(new_user_path)
    expect(page).to have_content("Email has already been taken")
  end
end
