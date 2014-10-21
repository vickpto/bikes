class CreateSellers < ActiveRecord::Migration
  def change
    create_table :sellers do |t|
      t.integer :personId, null:false
      t.integer :document, null:false
      t.string :username, null:false, :limit =>50
      t.string :userLastName,  null:false, :limit =>50
      t.string :email,  null:false, :limit =>50
      t.string :password,  null:false
      t.string :telephone,  null:false, :limit =>20
      t.string :userType,  null:false, :limit=>10
      t.boolean :status,  null:false
    end
  end
end
