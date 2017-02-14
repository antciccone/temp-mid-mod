require 'rails_helper'


describe "As a Logged in User" do
  context "when I visit index path" do
    it "I can enter a link through the form", :js => true do
      User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))

      visit login_path
      fill_in :Email, with: 'test@test.com'
      fill_in :Password, with: "test"
      click_on "Log In!"


      fill_in :Url, with: "https://www.linkedin.com/"
      fill_in :Title, with: "LinkedIn"
      click_on "Submit Link"

      expect(page).to have_content("https://www.linkedin.com/")
      expect(page).to have_content("LinkedIn")
      expect(page).to have_content("false")
    end
  end

  xit "I see an error if an enter an invalid url", :js => true do
    User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))

    visit login_path
    fill_in :Email, with: 'test@test.com'
    fill_in :Password, with: "test"
    click_on "Log In!"


    fill_in :Url, with: "//www.linkedin.com/"
    fill_in :Title, with: "LinkedIn"
    click_on "Submit Link"

    expect(page).to have_content("https://www.linkedin.com/")
    expect(page).to have_content("LinkedIn")
    expect(page).to have_content("false")

  end
end
