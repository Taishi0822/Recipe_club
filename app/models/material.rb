class Material < ApplicationRecord

validates :name, presence: true
validates :weigh, presence: true
# アソシエーション
  belongs_to :menu

end
