class CatalogController < ApplicationController
  def index
  	@productsB = Product.where(:typeProduct => 'BIKE')
  end
end
