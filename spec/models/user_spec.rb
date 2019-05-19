require 'rails_helper'

RSpec.describe User, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
    describe "Associations" do
      it "has many authorizations" do
        assc = described_class.reflect_on_association(:authorizations)
        expect(assc.macro).to eq :has_many
      end
    
      it "has many restaurants" do
        assc = described_class.reflect_on_association(:restaurants)
        expect(assc.macro).to eq :has_many
      end
      
      it "has many ratings" do
        assc = described_class.reflect_on_association(:ratings)
        expect(assc.macro).to eq :has_many
      end
    end
end
