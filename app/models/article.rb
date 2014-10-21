class Article < ActiveRecord::Base
	validates_length_of :articleTitle, :within => 1..50
	validates_length_of :body, :within => 1..10000
	validates_length_of :summary, :within => 1..5000
end
