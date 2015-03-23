class CreateCarts < ActiveRecord::Migration
  def change
    create_table :carts do |t|
      t.belongs_to :user
      t.timestamps null: false
    end
    add_index :carts, :id
  end
end
