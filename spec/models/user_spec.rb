require 'rails_helper'

RSpec.describe User, type: :model do
  context 'relationships' do
    it "has mean links" do
      user = User.new

      expect(user).to respond_to(:links)
    end
  end
end
