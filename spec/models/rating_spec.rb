require 'rails_helper'

RSpec.describe Rating, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
  
  describe "Associations" do
      it "belongs to user" do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
    
      it "belongs to food" do
        assc = described_class.reflect_on_association(:food)
        expect(assc.macro).to eq :belongs_to
      end
    end
end

