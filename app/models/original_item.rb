class OriginalItem < ApplicationRecord
  has_one :buy
  belongs_to :user
  has_many :comments
  has_many :likes
  has_many :liked_users, through: :likes, source: :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :state
  belongs_to :category1
  belongs_to :category2
  belongs_to :size
  belongs_to :color
  belongs_to :delivery_style
  belongs_to :prefecture
  belongs_to :delivery_day

  with_options presence: true do
    validates :name
    validates :description
    validates :image, presence: { message: 'を選択してください' }
    validates :price, numericality: { with: /\A[0-9]+\z/, message: 'には半角数字での入力をしてください' }
  end

  validates_inclusion_of :price, in: 300..9_999_999, message: 'の制限内で設定してください'

  with_options numericality: { other_than: 1, message: 'を選択してください' } do
    validates :state_id
    validates :category1_id
    validates :category2_id
    validates :size_id
    validates :color_id
    validates :delivery_style_id
    validates :prefecture_id
    validates :delivery_day_id
  end
end
