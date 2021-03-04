class Purchase < ApplicationRecord
  belongs_to :user
  belongs_to :listing
  validates :payment_intent, presence: true
end
