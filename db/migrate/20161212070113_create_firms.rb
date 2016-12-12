class CreateFirms < ActiveRecord::Migration[5.0]
  def change
    create_table :firms do |t|
      t.string :name
      t.string :industry
      t.integer :tel
      t.text :address
      t.timestamps
    end
  end
end
