require 'rails_helper'

describe 'User' do
  context 'relationships' do
    it "has many links" do
      user = User.new(name: 'ant', email: 'ant@gmail.com')

      expect(user).to respond_to(:links)
    end
  end
end
