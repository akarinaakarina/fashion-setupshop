class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'SS' },
    { id: 3, name: 'S' },
    { id: 5, name: 'M' },
    { id: 6, name: 'L' },
    { id: 7, name: 'XL' },
    { id: 8, name: 'XXL' },
    { id: 9, name: '3XL' }
  ]

  include ActiveHash::Associations
  has_many :original_items
end
