class AddNameToComments < ActiveRecord::Migration[5.0]
  def change
    add_column :comments, :name, :string
    add_column :comments, :user_id, :integer
    add_index :comments, :user_id
  end
end
