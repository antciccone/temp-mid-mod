require 'rails_helper'

RSpec.describe Read, type: :model do
  context 'relationships' do
    it "belongs to link" do
      read = Read.new

      expect(read).to respond_to(:link)
    end
  end
end
