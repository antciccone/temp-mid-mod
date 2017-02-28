require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relationships' do
    it "has mean links" do
      user = User.new

      expect(user).to respond_to(:links)
    end
  end
  context 'validations' do
    it 'email uniqness' do
      link = Link.create(url: "https://www.yahoo.com")
      link2 = Link.create(url: "https://www.yahoo.com")

      expect(link2).to_not be_invalid
    end
  end
end
