FactoryBot.define do
  factory :message do
    subject { "Post Title" }
    body { "This is the post body" }
    conversation factory: :conversation
    user factory: :user
    read { false }
  end
end
