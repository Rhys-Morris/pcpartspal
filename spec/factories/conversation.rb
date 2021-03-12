FactoryBot.define do
    factory :conversation do
      sender factory: :user
    end
  end
  