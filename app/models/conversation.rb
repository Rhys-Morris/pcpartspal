class Conversation < ApplicationRecord
    belongs_to :sender, class_name: "User", foreign_key: "sender_id"
    belongs_to :receiver, class_name: "User", foreign_key: "receiver_id"
    has_many :messages, dependent: :destroy

    # Validations
    validates_uniqueness_of :sender_id, scope: :receiver_id

    # Find a conversation between two users
    scope :between, -> (sender_id,receiver_id) do
        where("(conversations.sender_id = ? AND conversations.receiver_id = ?) OR (conversations.receiver_id = ? AND conversations.sender_id = ?)", sender_id, receiver_id, sender_id, receiver_id)
      end

      def recipient(current_user)
        self.sender_id == current_user.id ? self.receiver : self.sender
      end
  end