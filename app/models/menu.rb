class Menu < ApplicationRecord

 has_one_attached :image
 belongs_to :genre
 belongs_to :user
 has_many :cooks, dependent: :destroy
 has_many :materials, dependent: :destroy

 accepts_nested_attributes_for :materials, :cooks, allow_destroy: true
end
