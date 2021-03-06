class Profile < ApplicationRecord
  belongs_to :user, optional: true
  has_many :watches, dependent: :destroy
  has_many :listings, through: :watches
  has_one_attached :image
  validates :location, presence: true
  validates :postcode, numericality: { greater_than: 200, less_than: 9945 }
  validates :bio, length: { maximum: 500 }

  #  Insert latitude and longitude into profile
  before_save :get_coords

  def get_coords
    response = Faraday.get("http://api.beliefmedia.com/postcodes/#{self.postcode}.json")
    parsed_response = JSON.parse(response.body)

    puts "--------------"
    puts parsed_response

    self.latitude = parsed_response["data"]["latitude"]
    self.longitude = parsed_response["data"]["longitude"]
  end
end
