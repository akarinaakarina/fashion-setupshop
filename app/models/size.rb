class Size < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'SS（22cm以下）' },
    { id: 3, name: 'S（22~23cm）' },
    { id: 5, name: 'M（23~24cm）' },
    { id: 6, name: 'L（24~25cm）' },
    { id: 7, name: 'XL（26~27cm）' },
    { id: 8, name: 'XXL（27~28cm）' },
    { id: 9, name: '3XL（28cm以上）' }
  ]

  include ActiveHash::Associations
  has_many :original_items
end
