class CreateClients < ActiveRecord::Migration
  def change
    create_table :clients do |t|
      t.integer :personId,null: false
      t.integer :document, null: false
      t.string :personName,null: false, :limit => 50
      t.string :lastName, null: false,:limit => 50
      t.string :telephone, null: false,:limit => 20
      t.boolean :personStatus, null: false
      t.date :birthDay, null:false
      t.boolean :publicity, default:false
      t.string :email, null: false,:limit => 50
    end
  end
end
