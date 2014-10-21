class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.integer :productId, null: false
      t.string :productReference, null: false, :limit=>10
      t.string :productName, null: false, :limit=>50
      t.string :productTradeMark, null: false, :limit=>50
      t.integer :productPrice, null: false
      t.boolean :productStatus, null: false
      t.string :productDescription, null: false, :limit=>300
      t.string :typeProduct,null: false, :limit=>10
      #Elementos de bicicleta
      t.string :measures, :limit=>50
      t.string :bikeType, :limit=>50
      #elementos de equipaciones
      t.string :size, :limit=>2
      t.string :gender, :limit=>1
    end
  end
end
