require 'rails_helper'

RSpec.describe "Listing Factory" do
    it "is valid" do
        expect(build(:listing)).to be_valid
    end
    context "testing factory properties" do
        before(:all) do
            @listing = build(:listing)
        end
        it "has the correct title" do
            expect(@listing.title).to eq "Samsung Pro Evo Plus 970"
        end
        it "has the correct price" do
            expect(@listing.price).to be 200
        end
        it "has a correct association with a user" do
            expect(@listing.user.username).to eq "Test_User"
        end
        it "has a correct association with a brand" do
            expect(@listing.brand.name).to eq "Samsung"
        end
        it "has a correct association with a category" do
            expect(@listing.category.name).to eq "Hard Drives and SSDs"
        end
    end
end

RSpec.describe "User Factory" do
    it "is valid" do
        expect(build(:user)).to be_valid
    end
    context "testing factory properties" do
        before(:all) do
            @user = build(:user)
        end
        it "has the correct email" do
            expect(@user.email).to eq "test@example.com"
        end
        it "has the correct username" do
            expect(@user.username).to eq "Test_User"
        end
    end
end

RSpec.describe "Brand Factory" do
    it "is valid" do
        expect(build(:brand)).to be_valid
    end
    context "testing factory properties" do
        it "has the correct name" do
            expect(build(:brand).name).to eq "Samsung"
        end
    end
end

RSpec.describe "Category Factory" do
    it "is valid" do
        expect(build(:category)).to be_valid
    end
    context "testing factory properties" do
        it "has the correct name" do
            expect(build(:category).name).to eq "Hard Drives and SSDs"
        end
    end
end

RSpec.describe "Purchase Factory" do
    it "is valid" do
        expect(build(:purchase)).to be_valid
    end
    context "testing factory properties" do
        before(:all) do
            @purchase = build(:purchase)
        end
        it "has the correct receipt_url" do
            expect(@purchase.receipt_url).to eq "https://example-receipt-url.com"
        end
        it "has the correct association with a listing" do
            expect(@purchase.listing.brand.name).to eq "Samsung"
        end
        it "has the correct association with a category" do
            expect(@purchase.user.email).to eq "test@example.com"
        end
    end

end