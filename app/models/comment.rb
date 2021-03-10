class Comment < ApplicationRecord
  belongs_to :original_item
  belongs_to :user

  with_options presence: true do
    validates :user_id
    validates :original_item_id
    validates :text
  end
end
