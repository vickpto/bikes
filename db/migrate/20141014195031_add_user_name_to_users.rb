class AddUserNameToUsers < ActiveRecord::Migration
	def change
		add_column :users, :personId, :integer, null: false
		add_column :users, :username, :string, null: false, :limit=>50
		add_column :users, :userLastName, :string, null: false, :limit=>50 
		add_column :users, :document, :integer, null: false
		add_column :users, :telephone, :string, null: false, :limit=>20
		add_column :users, :userType, :string, null: false
		add_column :users, :status, :boolean, null: false
	end
end
