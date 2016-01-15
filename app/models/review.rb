class Review < ActiveRecord::Base
  belongs_to :product
  belongs_to :user

  validates :content, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true

  def author
    self.user.full_name
  end

  def stars_rating
    stars = self.rating.to_i
    html_stars = "<button type=\"button\" class=\"btn btn-default btn-xs\">"
    html_stars << "<span class=\"glyphicon glyphicon-star\" aria-hidden=\"true\"></span>" * stars
    html_stars << "</button>"
    html_stars.html_safe
  end

end
