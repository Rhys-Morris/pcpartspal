require 'rails_helper'

RSpec.describe Profile, type: :model do
    context "validations" do
        before(:all) do
            @profile = build(:profile)
        end
        it "is valid when given all attributes" do
            expect(@profile).to be_valid
        end
    end
end