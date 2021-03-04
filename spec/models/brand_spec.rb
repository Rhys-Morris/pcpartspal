require 'rails_helper'

RSpec.describe Brand, type: :model do
    context "validations" do
        before(:all) do
            @brand = build(:brand)
        end
        it "is valid when given all attributes" do
            expect(@brand).to be_valid
        end
        it "is invalid when name is empty" do
            expect(build(:brand, name: nil)).to be_invalid
        end
        it "is invalid when a duplicate entry" do
            create(:brand)
            expect(@brand).to be_invalid
        end
    end
end