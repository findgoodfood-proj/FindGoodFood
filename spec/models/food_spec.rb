require 'rails_helper'

RSpec.describe Food, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"

    describe "Associations" do
      it "belongs to restaurant" do
        assc = described_class.reflect_on_association(:restaurant)
        expect(assc.macro).to eq :belongs_to
      end
    
      it "has many ratings" do
        assc = described_class.reflect_on_association(:ratings)
        expect(assc.macro).to eq :has_many
      end
    end
end
