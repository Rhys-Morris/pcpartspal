class Category < ApplicationRecord
    has_many :listings, dependent: :destroy
    validates :name, presence: true, uniqueness: true

    def self.sorted
        self.all.sort_by { |cat| cat.name }
    end

end
