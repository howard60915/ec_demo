class CreatePayments < ActiveRecord::Migration[5.0]
  def change
    create_table :payments do |t|
      t.integer :order_id
      t.string :payment_method
      t.integer :amount
      t.text :params
      t.boolean :paid, default: false
      t.timestamps
    end
    add_index :payments, :order_id
  end
end
