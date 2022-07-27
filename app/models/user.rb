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

  #退会機能
  def active_for_authentication?
    super && (is_deleted == false)
  end

  #ゲストログイン機能
  def self.guest
    find_or_create_by!(email: 'guest@email') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = 'ゲスト'
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
end