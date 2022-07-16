class Cook < ApplicationRecord

  has_one_attached :cook_image

  # アソシエーション
  belongs_to :menu

end
