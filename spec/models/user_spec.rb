require 'rails_helper'

RSpec.describe User, type: :model do
    context "validations" do
        before(:all) do
            @user = build(:user)
        end
    end
end