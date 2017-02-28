require 'rails_helper'

describe 'As a user',  :js => :true do
  context 'when I visit links page' do
    xit 'I can filter using the search bar' do

      link1 =   Link.create(url: "https://www.espn.com", title: "espn")
      link2 =   Link.create(url: "https://www.soccer.com", title: "soccer")
      Read.create(link_id: link1.id )
      Read.create(link_id: link2.id )

      visit links_path

      find(".search").set("espn")

      expect(page).to have_content("https://www.espn.com")
    end
  end
end
