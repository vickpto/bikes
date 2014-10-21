class CatalogController < ApplicationController
  def index
  	@productsB = Product.where(:typeProduct => 'BIKE')
  	@productsE = Product.where(:typeProduct => 'EQUIPMENT')
  	@productsA = Product.where(:typeProduct => 'ACCESORY')
  end
end
