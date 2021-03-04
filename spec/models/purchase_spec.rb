require 'rails_helper'

RSpec.describe Purchase, type: :model do
    context "validations" do
        before(:all) do
            @purchase = build(:purchase)
        end
        it "is valid when given all attributes" do
            expect(@purchase).to be_valid
        end
        it "is invalid when payment_id is empty" do
            expect(build(:purchase, payment_intent: nil)).to be_invalid
        end
    end
end