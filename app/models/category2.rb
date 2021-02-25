class Category2 < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'トップス（半袖）' },
    { id: 3, name: 'トップス（長袖）' },
    { id: 4, name: 'ショートアウター' },
    { id: 5, name: 'ロングアウター' },
    { id: 6, name: 'ボトムス' },
    { id: 7, name: 'シューズ' },
    { id: 8, name: 'アクセサリー' },
    { id: 9, name: 'バッグ' }
  ]

  include ActiveHash::Associations
  has_many :original_items
end
