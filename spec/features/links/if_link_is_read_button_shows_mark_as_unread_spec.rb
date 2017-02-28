require "rails_helper"

RSpec.describe "can create links", :js => :true do
  scenario "Create a new link" do

    visit "/"
    fill_in "Title:", :with => "Turing"
    fill_in "URL:", :with => "https://turing.io"
    click_on "Add Link"

    within('#links-list') do
      expect(page).to have_text("Turing")
      expect(page).to have_text("https://turing.io")
    end

  end
end
