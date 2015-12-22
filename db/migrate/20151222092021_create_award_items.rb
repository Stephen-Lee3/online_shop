class CreateAwardItems < ActiveRecord::Migration
  def change
    create_table :award_items do |t|
      t.string :name
      t.datetime :expire_at
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end
