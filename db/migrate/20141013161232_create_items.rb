class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.integer :saleId,null: false
      t.integer :productId, null: false
      t.integer :itemAmount, null: false
      #t.timestamps
    end
  end
end
