class Category < ActiveRecord::Base
  has_many :products, dependent: :delete_all

  validates :name,
            uniqueness: true,
            presence: true
end
