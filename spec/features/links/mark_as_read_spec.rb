require "rails_helper"

RSpec.describe "can mark links as read", :js => :true do
  scenario "Mark a link as read" do
    user = User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))
    Link.create(url:"https://turing.io", title:"Turing", user_id: user.id)
    visit login_path

    fill_in :Email, with: 'test@test.com'
    fill_in :Password, with: "test"
    click_on "Log In!"

    save_and_open_page
    within('.read-status') do
      expect(page).to have_text("false")
    end

    click_on "Mark as Read"

    within('.read-status') do
      expect(page).to have_text("true")
    end

  end
end
