require 'rails_helper'

RSpec.describe Location, type: :model do
    context "validations" do
        before(:all) do
            @location = build(:location)
        end
        it "should only allow postcodes within a valid range" do
            @location.postcode = "10000"
            expect(@location).to be_invalid
        end
        it "should allow postcodes within a valid range" do
            @location.postcode = "3000"
            expect(@location).to be_valid
        end
        it "should only allow state abbreviations between 2-3 letters" do
            @location.state = "New South Wales"
            expect(@location).to be_invalid
        end
        it "should only allow state abbreviations between 2-3 letters" do
            @location.state = "NSW"
            expect(@location).to be_valid
        end
        it "should only allow city names < 100 chars" do
            @location.city = "a" * 101
            expect(@location).to be_invalid
        end
    end
    context "santizations" do
        before(:all) do
            @location = build(:location)
        end
        it "should convert states to uppercase before save" do
            @location.state = "nsw"
            @location.save
            expect(@location.state).to eq "NSW"
        end
    end
end
