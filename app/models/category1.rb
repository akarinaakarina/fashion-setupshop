class Category1 < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'レディース' },
    { id: 3, name: 'メンズ' },
    { id: 4, name: 'ベビー・キッズ' }
  ]

  include ActiveHash::Associations
  has_many :original_items
end
