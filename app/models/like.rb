class Like < ApplicationRecord
  belongs_to :original_item
  belongs_to :user
  validates_uniqueness_of :original_item_id, scope: :user_id
end
