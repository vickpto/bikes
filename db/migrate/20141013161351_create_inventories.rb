class CreateInventories < ActiveRecord::Migration
  def change
    create_table :inventories do |t|
      t.integer :productAmount, null: false
      t.integer :productId, null: false
      t.date :agregationDate, null: false
      #t.timestamps
    end
  end
end
