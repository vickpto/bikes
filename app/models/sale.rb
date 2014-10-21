class Sale < ActiveRecord::Base
	validates_length_of :note, :within => 1..300
end
