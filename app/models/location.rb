class Location < ApplicationRecord
    has_many :users, dependent: :destroy

    # Validations
    validates :city, presence: true, length: { maximum: 100 }
    validates :state, presence: true, length: { maximum: 3, minimum: 2 }
    validates :postcode, presence: true, length: { is: 4 }, numericality: { greater_than: 0200, less_than: 9950 }

    before_save :state_uppercase
    
    def state_uppercase
        self.state = state.upcase
    end 
end