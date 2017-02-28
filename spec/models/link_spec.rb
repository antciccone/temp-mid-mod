require 'rails_helper'

RSpec.describe Link, type: :model do
  context 'relationships' do
    it "has mean reads" do
      link = Link.new

      expect(link).to respond_to(:reads)
    end
  end
end
