class CreateOriginalItems < ActiveRecord::Migration[6.0]
  def change
    create_table :original_items do |t|
      t.string      :name,              null: false
      t.text        :description,       null: false
      t.integer     :category1_id,      null: false
      t.integer     :category2_id,      null: false
      t.integer     :size_id,           null: false
      t.integer     :color_id,          null: false
      t.integer     :delivery_style_id, null: false
      t.integer     :prefecture_id,     null: false   
      t.integer     :delivery_day_id,   null: false
      t.integer     :price,             null: false
      t.references  :user,              null: false, foreign_key: true
      t.timestamps
    end
  end
end
