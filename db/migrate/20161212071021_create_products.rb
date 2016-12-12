class CreateProducts < ActiveRecord::Migration[5.0]
  def change
    create_table :products do |t|
      t.string :name
      t.text :content
      t.integer :price
      t.integer :category_id
      t.integer :firm_id
      t.boolean :activated, :default => true
      t.timestamps
    end
    add_index :products, :category_id
    add_index :products, :firm_id
  end
end
