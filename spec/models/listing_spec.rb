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
    context "santizations" do
        before(:all) do
            @listing = build(:listing)
        end
        it "strips whitespace at the beginning and end of a title" do
            @listing.title = "    Title     "
            @listing.save
            expect(@listing.title).to eq "Title"
        end
        it "strips whitespace at the beginning and end of a description" do
            @listing.description = "    Description     "
            @listing.save
            expect(@listing.description).to eq "Description"
        end
        it "converts a dollar value to cents prior to save" do
            @listing.price = 100.45
            @listing.save
            expect(@listing.price).to eq 10045
        end
    end
end