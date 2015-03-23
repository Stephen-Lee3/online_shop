class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.belongs_to :product
      t.belongs_to :cart
      t.timestamps null: false
    end
  end
end
