class Cook < ApplicationRecord

  has_one_attached :cook_image
  belongs_to :menu

end
