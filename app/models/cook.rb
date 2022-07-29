class Cook < ApplicationRecord

  has_one_attached :cook_image

  validates :cooks_count, presence: true
  validates :text, presence: true
  # アソシエーション
  belongs_to :menu

end
