class ChangeColumnToCategories < ActiveRecord::Migration
  def change
  	change_column :categories, :ancestry, :string, default: nil
  end
end
