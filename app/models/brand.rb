class Brand < ApplicationRecord
    has_many :listings, dependent: :destroy
    validates :name, presence: true, uniqueness: true

    def self.sorted
        self.all.sort_by { |brand| brand.name }
    end

    def self.sample(amount)
        self.all.sample(amount)
    end

end
