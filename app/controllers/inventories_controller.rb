class InventoriesController < ApplicationController
  before_action :set_inventory, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  def index
    @inventories = Product.all
    
  end

  def show
    @product=Product.find(params[:id])
  end

  def new
    @inventory = Inventory.new
    @products=Product.all
    
  end

  def edit
  end

  def create
    @inventory = Inventory.new(inventory_params)
    @inventory.agregationDate=Time.now
    respond_to do |format|
      if @inventory.save
        format.html { redirect_to @inventory, notice: 'Se han agregado correctamente las cantidads al inventario.' }
        format.json { render :show, status: :created, location: @inventory }
      else
        format.html { render :new }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @inventory.update(inventory_params)
        format.html { redirect_to @inventory, notice: 'El inventario modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @inventory }
      else
        format.html { render :edit }
        format.json { render json: @inventory.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @inventory.destroy
    respond_to do |format|
      format.html { redirect_to inventory_url, notice: 'El registro del inventario se ha deshabilitado.' }
      format.json { head :no_content }
    end
  end


  private
    def set_inventory
      @inventory = Inventory.find(params[:id])
    end

    def inventory_params
      params.require(:inventory).permit(:productAmount, :productId, :agregationDate)
    end
end
