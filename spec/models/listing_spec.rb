require 'rails_helper'

RSpec.describe Listing, type: :model do
    context "validations" do
        before(:all) do
            @listing = build(:listing)
        end
        it "is valid when given all attributes" do
            expect(@listing).to be_valid
        end
        it "is invalid when title is empty" do
            expect(build(:listing, title: nil)).to be_invalid
        end
        it "is invalid when price is empty" do
            expect(build(:listing, price: nil)).to be_invalid
        end
        it "is invalid when price is < 1" do
            expect(build(:listing, price: 0)).to be_invalid
        end
        it "is invalid when description length is > 500 characters" do
            expect(build(:listing, description: "1"*501)).to be_invalid
        end
        it "is invalid when condition is empty" do
            expect(build(:listing, condition: nil)).to be_invalid
        end
    end
end