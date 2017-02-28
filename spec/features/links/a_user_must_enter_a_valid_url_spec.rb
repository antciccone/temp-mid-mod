require "rails_helper"

RSpec.describe "as a user", :js => :true do
  context "when I create an invalid link" do
    scenario "you url is not added" do
      user = User.create(email: 'ant@ant.com', password_digest: BCrypt::Password.create("test"))
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)
      
      visit "/"
      fill_in "Title:", :with => "Turing"
      fill_in "URL:", :with => "turing.io"
      click_on "Add Link"

      expect(page).to_not have_content("turing.io")
    end
  end
end
