require 'rails_helper'

describe 'As a signed in user' do
  context 'I can click edit a link' do
    it 'and I can edit the link in a form' do
      user = User.create(email: 'test@test.com', password_digest: BCrypt::Password.create("test"))
      link = Link.create(url: "https://www.google.com", title: 'google', user_id: user.id)

      visit login_path

      fill_in :Email, with: 'test@test.com'
      fill_in :Password, with: "test"
      click_on "Log In!"

      expect(page).to have_content('google')

      click_on "Edit"

      expect(current_path).to eq(edit_link_path(link))

      fill_in 'link[title]', with: "google!"
      click_on "Submit Link"

      expect(page).to have_content('google!')
      expect(current_path).to eq(links_path)

    end
  end
end
