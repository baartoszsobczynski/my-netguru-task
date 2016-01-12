class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :description, presence: true
  validates :price,
            presence: true,
            format: { with: /\A\d+(?:\.\d{0,2})?\z/ }

  def average_rating
    ratings = []
    self.reviews.each do |review|
      ratings << review.rating
    end
    ratings.inject{ |sum, el| sum + el }.to_f / ratings.size
  end
end
