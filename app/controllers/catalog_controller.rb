class CatalogController < ApplicationController
  def index
  	@productsB = Product.where(:typeProduct => 'BIKE', :productStatus => 1)
  	@productsE = Product.where(:typeProduct => 'EQUIPMENT', :productStatus => 1)
  	@productsA = Product.where(:typeProduct => 'ACCESORY', :productStatus => 1)
  end
end
