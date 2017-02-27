require 'rails_helper'

describe 'As a user', js:true do
  context 'when I visit links page' do
    xit 'I can filter using the search bar' do

      Link.create(url: "https://www.espn.com", title: "espn")
      Link.create(url: "https://www.soccer.com", title: "soccer")

      visit links_path

      find("#Myinput").set("espn")

      save_and_open_page
      expect(current_path).to eq(new_user_path)
    end
  end
end
