class CreateSales < ActiveRecord::Migration
  def change
    create_table :sales do |t|
      t.integer :saleId,null: false
      t.integer :sellerId, null: false
      t.integer :clientId, null: false
      t.date :saleDate, null: false
      t.boolean :saleStatus, null:false
      t.string :note, :limit=>300, null:false
      #t.timestamps
    end
  end
end
