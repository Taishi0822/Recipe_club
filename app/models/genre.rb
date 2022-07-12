class Genre < ApplicationRecord
  # アソシエーション
  has_many :menus, dependent: :destroy
end
