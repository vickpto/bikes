class ProductsController < ApplicationController

  respond_to :html, :xml, :json
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    @products = Product.all

  end

  def show

  end

  def new
    @product = Product.new
    
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    if Product.all.nil?
      @product.productId=1
    else
      @product.productId = Product.all.count+1
    end
    @product.productStatus=true
    @product.productReference= product_params[:productReference].upcase
    @product.productName=product_params[:productName].capitalize
    @product.productTradeMark=product_params[:productTradeMark].upcase
    #@product.bikeType=product_params[:bikeType].capitalize
    @product.save
    respond_to do |format|
      if @product.typeProduct == 'EQUIPMENT'
        if @product.save
          format.html { redirect_to equipment_path(@product), notice: 'Equipacion creada correctamente.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

      if @product.typeProduct == 'BIKE'
        if @product.save
          format.html { redirect_to bike_path(@product), notice: 'Bicicleta creada correctamente.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end

      if @product.typeProduct == 'ACCESORY' || @product.typeProduct == 'SPARE'
        if @product.save
          format.html { redirect_to accesory_part_path(@product), notice: 'Accesorio - Repuesto creado correctamente.' }
          format.json { render :show, status: :created, location: @product }
        else
          format.html { render :new }
          format.json { render json: @product.errors, status: :unprocessable_entity }
        end
      end
      
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        if @product.typeProduct == 'EQUIPMENT'
          format.html { redirect_to equipment_path(@product), notice: 'Equipacion modificada correctamente.' }
          format.json { render :show, status: :ok, location: @product }
        end
        if @product.typeProduct == 'BIKE'
          format.html { redirect_to bike_path(@product), notice: 'Bicicleta creada correctamente.' }
          format.json { render :show, status: :ok, location: @product }

        end
        if @product.typeProduct == 'ACCESORY' || @product.typeProduct == 'SPARE'

          format.html { redirect_to accesory_part_path(@product), notice: 'Accesorio - Repuesto creado correctamente.' }
          format.json { render :show, status: :ok, location: @product }
        end
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    respond_to do |format|
      if @product.typeProduct == 'EQUIPMENT'
        if @product.productStatus==true
          format.html { redirect_to equipment_index_url, notice: 'Equipacion deshabilitada.' }
          @product.productStatus=false
        else
          format.html { redirect_to equipment_index_url, notice: 'La equipacion ha sido habilitada.' }
          @product.productStatus=true
        end
      end

      if @product.typeProduct == 'BIKE'
        if @product.productStatus==true
          format.html { redirect_to bikes_path, notice: 'Equipacion deshabilitada.' }
          @product.productStatus=false
        else
          format.html { redirect_to bikes_path, notice: 'La equipacion ha sido habilitada.' }
          @product.productStatus=true
        end
      end

      if @product.typeProduct == 'ACCESORY'
        if @product.productStatus==true
          format.html { redirect_to accesory_parts_path, notice: 'Equipacion deshabilitada.' }
          @product.productStatus=false
        else
          format.html { redirect_to accesory_parts_path, notice: 'La equipacion ha sido habilitada.' }
          @product.productStatus=true
        end
      end
      format.json { head :no_content }
    end
    @product.save
  end

  private
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:productId, :productReference, :productName, :productTradeMark, :productPrice, :productStatus, :productDescription, :typeProduct, :measures, :bikeType, :size, :gender, :image)
  end

end
