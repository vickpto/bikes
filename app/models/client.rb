class Client < ActiveRecord::Base
	validates_uniqueness_of :personId, :message => "El identificador para esta persona ya existe"
	validates_uniqueness_of :document, :message => "El documento de esa persona ya existe"
	validates_length_of :personName, :within => 1..50
	validates_length_of :document, :within => 7..11
	validates_length_of :lastName, :within => 1..50
	validates_length_of :telephone, :within => 6..20
	def dataClients
		"#{document}: #{personName} #{lastName}"
	end
end
