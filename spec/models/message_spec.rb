require 'rails_helper'

RSpec.describe Message, type: :model do
    context "validations" do
        before(:all) do
            @message = build(:message)
        end
        it "should have a body < 500 chars" do
            @message.body = "a" * 501
            expect(@message).to be_invalid
        end
        it "should have a subject < 50 chars" do
            @message.subject = "a" * 51
            expect(@message).to be_invalid
        end
        it "should be invalid without a body or title" do
            @message.body = ""
            expect(@message).to be_invalid
            @blank_subject = build(:message)
            @blank_subject.subject = ""
            expect(@blank_subject).to be_invalid
        end
    end
end
