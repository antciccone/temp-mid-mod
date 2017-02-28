require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'relationships' do
    it "has many reads" do
      link = Link.new

      expect(link).to respond_to(:reads)
    end
    it "belongs to user" do
      link = Link.new

      expect(link).to respond_to(:user)
    end
  end
end
