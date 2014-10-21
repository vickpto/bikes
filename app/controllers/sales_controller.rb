class SalesController < ApplicationController
  before_action :set_sale, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  def index
    query="select distinct(s.saleId), (select concat(username,'  ', userLastName) from sellers where personId=s.sellerId), (select concat(personName, ' ', lastName) from clients where personId=s.clientId), s.saleDate, s.note from sales s, items i where s.saleId=i.saleId"
    @sales=ActiveRecord::Base.connection.execute(query)
    
    
  end

  def show

  end

  def new
    @sale = Sale.new
    @sellers=Seller.all
    @clients=Client.all

    
  end

  def edit
  end

  def create
    @sale = Sale.new(sale_params)
    if Sale.all.nil?
      @sale.saleId=1
    else
      @sale.saleId = Sale.all.count+1
    end
    @sale.saleStatus=true
    @sale.save
    respond_to do |format|
      if @sale.save
        format.html { redirect_to new_item_path(:saleId => @sale.saleId) }
        format.json { render :show, status: :created, location: @sale }
      else
        format.html { render :new }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @sale.update(sale_params)
        format.html { redirect_to @sale, notice: 'Venta modificada satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @sale }
      else
        format.html { render :edit }
        format.json { render json: @sale.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@sale.destroy
    respond_to do |format|
      if @sale.saleStatus==true
        format.html { redirect_to sale_url, notice: 'Venta deshabilitada.' }
        @sale.saleStatus=false
      else 
        format.html { redirect_to sale_url, notice: 'La venta se ha habilitado.' }
        @sale.saleStatus=true
        format.json { head :no_content }
      end
      @sale.save
    end
  end

  private
  def set_sale
    @sale = Sale.find(params[:id])
  end

  def sale_params
    params.require(:sale).permit(:saleId, :sellerId, :clientId, :saleDate, :saleStatus, :note)
  end
end

