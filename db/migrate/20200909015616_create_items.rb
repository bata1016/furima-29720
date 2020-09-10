class CreateItems < ActiveRecord::Migration[6.0]
  # カラム
  def change
    create_table :items do |t|
      t.string      :name,              null: false 
      t.integer     :price,             null: false, 
      t.text        :description,       null: false 
      t.references  :user,              foreign_key: true
      t.integer     :category_id,       null: false 
      t.integer     :delivery_fee_id,   null: false 
      t.integer     :delivery_date_id,  null: false 
      t.integer     :statement_id,      null: false 
      t.integer     :prefecture_id,     null: false 
      t.timestamps
    end
  end
end
