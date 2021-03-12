class Location < ApplicationRecord
    has_many :users, dependent: :destroy

    # Validations
    validates :city, presence: true, length: { maximum: 100 }
    validates :state, presence: true, length: { maximum: 3, minimum: 2 }
    validates :postcode, presence: true, length: { is: 4 }

    before_save :state_uppercase

    def state_uppercase
        self.state = state.upcase
    end 
end