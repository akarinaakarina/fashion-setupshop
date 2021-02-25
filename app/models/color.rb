class Color < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'ホワイト' },
    { id: 3, name: 'ブラック' },
    { id: 4, name: 'グレー' },
    { id: 5, name: 'シルバー' },
    { id: 6, name: 'ゴールド' },
    { id: 7, name: 'メタリック' },
    { id: 8, name: 'ブラウン' },
    { id: 9, name: 'ナチュラル' },
    { id: 10, name: 'パープル' },
    { id: 11, name: 'グリーン' },
    { id: 12, name: 'ブルー' },
    { id: 13, name: 'レッド' },
    { id: 14, name: 'ピンク' },
    { id: 15, name: 'オレンジ' },
    { id: 16, name: 'イエロー' },
    { id: 17, name: 'マルチカラー' }
  ]

  include ActiveHash::Associations
  has_many :original_tems
end
