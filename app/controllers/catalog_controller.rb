class CatalogController < ApplicationController
  def index
  	@products = Product.all
  end
end
