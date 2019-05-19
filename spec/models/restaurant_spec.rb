require 'rails_helper'

RSpec.describe Restaurant, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"

    describe "Associations" do
      it "belongs to user" do
        assc = described_class.reflect_on_association(:user)
        expect(assc.macro).to eq :belongs_to
      end
    
      it "has many foods" do
        assc = described_class.reflect_on_association(:foods)
        expect(assc.macro).to eq :has_many
      end
    end
end
