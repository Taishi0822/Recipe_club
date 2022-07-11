class Menu < ApplicationRecord

 has_one_attached :image
 
 # アソシエーション
 belongs_to :genre
 belongs_to :user
 has_many :cooks, dependent: :destroy
 has_many :materials, dependent: :destroy

 # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
 # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
 accepts_nested_attributes_for :materials, :cooks, reject_if: :all_blank, allow_destroy: true
end
