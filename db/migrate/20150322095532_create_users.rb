# -*- encoding : utf-8 -*-
class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nick_name
      t.string :address
      t.integer :phone
      t.string :real_name

      t.timestamps null: false
    end
    add_index :users, :id
  end
end
