class CreateContractHistories < ActiveRecord::Migration
  def change
    create_table :contract_histories do |t|
      t.integer :personId, null: false
      t.date :contractDate, null: false
      t.date :finalContractDate
      #t.timestamps
    end
  end
end
