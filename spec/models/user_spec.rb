require 'rails_helper'

RSpec.describe User, type: :model do
    context "validations" do
        before(:all) do
            @user = build(:user)
        end
        it "should reject usernames that contain invalid characters" do
            invalid_usernames = ["rhys=cool", "hello.", "{kyle}", "[Wizard!]"]
            invalid_usernames.each do |name|
                @user.username = name
                expect(@user).to be_invalid, "#{name} should be invalid"
            end
        end
        it "should accept usernames of only valid characters" do
            invalid_usernames = ["rhys_cool", "hello", "KyLeS", "01000100"]
            invalid_usernames.each do |name|
                @user.username = name
                expect(@user).to be_valid
            end
        end
        it "should have a username between 5 to 25 chars" do
            @user.username = "1234"
            expect(@user).to be_invalid
            @user.username = "a" * 26
            expect(@user).to be_invalid
            @user.username = "Valid"
            expect(@user).to be_valid
        end
    end
end