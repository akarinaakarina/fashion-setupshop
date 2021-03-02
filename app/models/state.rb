class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'オリジナル商品' },
    { id: 3, name: 'セレクト商品（新品）' },
    { id: 4, name: 'セレクト商品（中古品）' }
  ]

  include ActiveHash::Associations
  has_many :original_items
end