require 'rails_helper'

RSpec.describe Category, type: :model do
    context "validations" do
        before(:all) do
            @category = build(:category)
        end
        it "is valid when given all attributes" do
            expect(@category).to be_valid
        end
        it "is invalid when name is empty" do
            expect(build(:category, name: nil)).to be_invalid
        end
        it "is invalid when a duplicate entry" do
            create(:category)
            expect(@category).to be_invalid
        end
    end
end