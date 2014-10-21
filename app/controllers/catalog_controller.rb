class CatalogController < ApplicationController
  def index
  	@bikes = Bike.all
  	@equipments = Equipment.all
  	@accesory_parts = AccesoryPart.all
  end
end
