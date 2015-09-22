class AddSalesToProducts < ActiveRecord::Migration
  def change
    add_column :products, :sales, :integer, default: 0
  end
end
