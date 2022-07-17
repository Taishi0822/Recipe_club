class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # アソシエーション
  has_one_attached :profile_image
  has_many :menus, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :checks, dependent: :destroy
  has_many :comments, dependent: :destroy


  validates :name, presence: true

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
