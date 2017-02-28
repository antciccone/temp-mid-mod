require "rails_helper"

RSpec.describe "can create links", :js => :true do
  xscenario "Create a new link" do
    link1 =   Link.create(url: "https://www.espn.com", title: "espn", read: true)
    Read.create(link_id: link1.id )

    visit '/'

    expect(page).to have_content("Mark as Unread")
    expect(page).to_not have_content("Mark as Read")

  end
end
