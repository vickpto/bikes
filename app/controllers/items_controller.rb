class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  def index
    @items = Item.all
    
  end

  def show
    
  end

  def new
    @item = Item.new
    @bikes= Bike.new
    
  end

  def edit
  end

  def create
    @item = Item.new(item_params)
    @item.save
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item fue creado correctamente.' }
        format.json { render :show, status: :created, location: @item }
      else
        format.html { render :new }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @item.update(item_params)
        format.html { redirect_to @item, notice: 'Item modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @item }
      else
        format.html { render :edit }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @item.destroy
    respond_to do |format|
      format.html { redirect_to item_url, notice: 'El item se ha deshabilitado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:saleId, :productId, :itemAmount)
    end
end
