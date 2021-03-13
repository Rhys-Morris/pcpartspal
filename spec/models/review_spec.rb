require 'rails_helper'

RSpec.describe Review, type: :model do
    context "validations" do
        before(:all) do
            @review = build(:review)
        end
        it "should be invalid without a rating" do
            @review.rating = nil
            expect(@review).to be_invalid
        end
        it "should be invalid without a message" do
            @review.message = nil
            expect(@review).to be_invalid
        end
        it "should be invalid with a rating < 1" do
            @review.rating = 0
            expect(@review).to be_invalid
        end
        it "should be invalid with a rating > 5" do
            @review.rating = 6
            expect(@review).to be_invalid
        end
        it "should have a message < 250 chars" do
            @review.message = "a" * 251
            expect(@review).to be_invalid
        end
    end
    context "sanitizations" do
        before(:all) do
            @review = build(:review)
        end
        # Failing due to a not null user_id on listing - why?
        # it "should strip leading and trailing whitespace from message" do
        #     @review.message = "     Hello      "
        #     @review.save
        #     expect(@review).to eq "Hello"
        # end
    end
end
