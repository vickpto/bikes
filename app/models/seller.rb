class Seller < ActiveRecord::Base


  validates_presence_of :username, :message => " no puede ser un campo vacio"
  validates_presence_of :userLastName, :message => " no puede ser un campo vacio"
  validates_presence_of :document , :message => " no puede ser un campo vacio"
  validates_uniqueness_of :document , :message => " ya ha sido registrado "
  validates_length_of :document, :within => 8..11 
  validates_presence_of :telephone, :message => " no puede ser un campo vacio"
  validates_length_of :telephone, :within => 6..20
  validates_presence_of :email, :message => " no puede ser un campo vacio"
  validates_presence_of :password, :message => " no puede ser un campo vacio"


	def dataSellers
		"#{document}: #{username}  #{userLastName}"
	end

end
