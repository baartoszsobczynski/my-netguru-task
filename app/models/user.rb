class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :reviews
  has_many :products

  validates :firstname, presence: true
  validates :lastname, presence: true

  def full_name
    "#{self.firstname} #{self.lastname}"
  end

end
