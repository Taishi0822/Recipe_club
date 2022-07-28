class Genre < ApplicationRecord
  # アソシエーション
  has_many :menus, ->{order('created_at DESC')}, dependent: :destroy

  def menu_limit
    self.menus.limit(4)
  end
end
