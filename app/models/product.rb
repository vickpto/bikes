class Product < ActiveRecord::Base
	validates_uniqueness_of :productId, :message => "El identificador para esta persona ya existe"
	validates_length_of :productReference, :within => 1..10
	validates_length_of :productName, :within => 1..50
	validates_length_of :productTradeMark, :within => 1..50
	validates_length_of :productDescription, :within => 1..300
	#validates_length_of :measures, :within => 1..50
	#validates_length_of :bikeType, :within => 1..50
	validates_presence_of :image , :message => " Debes subir una imagen"
	#validates_length_of :typeProduct, :within => 1..10
	#validates_length_of :size, :within => 1..2
	#validates_length_of :gender, :within => 1..1
	
	has_attached_file :image, :styles => { :small => "220x220#" , :medium => "250x250#" }
	#validates_attachment :image, presence: true, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png"] }
	#validates_attachment_content_type :image, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]
	#validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
	validates_attachment :image, content_type: { content_type: /\Aimage\/.*\Z/ }
end
