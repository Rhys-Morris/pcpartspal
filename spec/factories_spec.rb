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
        it "has the correct association with a user" do
            expect(@purchase.user.email).to eq "test@example.com"
        end
    end
end

RSpec.describe "Profile Factory" do
    it "is valid" do
        expect(build(:profile)).to be_valid
    end
    context "testing factory properties" do
        before(:all) do
            @profile = build(:profile)
        end
        it "has the correct postcode" do
            expect(@profile.postcode).to be 3000
        end
        it "has the correct bio" do
            expect(@profile.bio).to eq "This is a user bio"
        end
        it "has the correct association with a user" do
            expect(@profile.user.email).to eq "test@example.com"
        end
    end
end

RSpec.describe "Watch Factory" do
    it "is valid" do
        expect(build(:watch)).to be_valid
    end
    context "testing factory properties" do
        before(:all) do
            @watch = build(:watch)
        end
        it "has the correct association with a profile and user" do
            expect(@watch.profile.user.email).to eq "test@example.com"
        end
        it "has the correct association with a listing" do
            expect(@watch.listing.brand.name).to eq "Samsung"
        end
    end
end