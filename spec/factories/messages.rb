FactoryBot.define do
  factory :message do
    subject { "MyString" }
    body { "MyText" }
    conversation { nil }
    user { nil }
    read { false }
  end
end
