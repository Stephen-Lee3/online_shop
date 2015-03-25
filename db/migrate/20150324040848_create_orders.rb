class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :buyer
      t.string :phone
      t.string :address
      t.belongs_to :user
      t.timestamps null: false
    end
  end
end
