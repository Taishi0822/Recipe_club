class Menu < ApplicationRecord

 has_one_attached :image

 # アソシエーション
 belongs_to :genre
 belongs_to :user
 has_many :cooks, dependent: :destroy
 has_many :materials, dependent: :destroy
 has_many :favorites, dependent: :destroy
 has_many :checks, dependent: :destroy
 has_many :comments, dependent: :destroy

 validates :name, presence: true
 validates :explanation, presence: true



 # reject_ifは、入力フォームを追加しているもののすべてが空白の場合にリジェクトする
 # allow_destroyは、入力フォームでこのオブジェクトが削除された際に削除を許可する
 accepts_nested_attributes_for :materials, :cooks, reject_if: :all_blank, allow_destroy: true

 # 引数で渡されたユーザーIDがCheckテーブル内に存在するか確認
 def checked_by?(user)
    checks.exists?(user_id: user.id)
 end

# 引数で渡されたユーザーIDがFavoriteテーブル内に存在するか確認
 def favorited_by?(user)
    favorites.exists?(user_id: user.id)
 end

 # 検索方法分岐
  def self.looks(search, word)
      @menu = Menu.where("name LIKE?","%#{word}%")
  end

end
