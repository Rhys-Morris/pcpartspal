FactoryBot.define do
  factory :message do
    subject { "Post Title" }
    body { "This is the post body" }
    conversation { nil }
    user factory: :user
    read { false }
  end
end
