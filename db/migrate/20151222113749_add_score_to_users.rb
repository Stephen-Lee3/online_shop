class AddScoreToUsers < ActiveRecord::Migration
  def change
    add_column :users, :score, :decimal, precision: 8, scale: 2,default: 0,null: false
  end
end
