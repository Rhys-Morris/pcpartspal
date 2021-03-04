require 'rails_helper'

RSpec.describe Profile, type: :model do
    context "validations" do
        before(:all) do
            @profile = build(:profile)
        end
        it "is valid when given all attributes" do
            expect(@profile).to be_valid
        end
        it "is invalid when postcode is invalid number" do
            expect(build(:profile, postcode: 199)).to be_invalid
            expect(build(:profile, postcode: 9945)).to be_invalid
        end
        it "is invalid when bio > than 500 characters" do
            expect(build(:profile, bio: "1"*501)).to be_invalid
        end
    end
end