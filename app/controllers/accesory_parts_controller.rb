class AccesoryPartsController < ApplicationController
before_action :set_product, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json

before_filter :authenticate_user!
  
  def index
  	@products = Product.all
  	respond_to do |format|
  		format.html
  		format.pdf do
  			generateReport(@products)
  		end
  	end
  end

  def show
  end

  def new
  	@product = Product.new
  end

  def edit
  end

  def create
    @accesory_part = AccesoryPart.new(accesory_part_params)
     if AccesoryPart.all.nil?
      @accesory_part.productId=1
    else
      @accesory_part.productId = AccesoryPart.all.count+1
    end
    @accesory_part.productStatus=true
    @accesory_part.productReference=accesory_part_params[:productReference].upcase
    @accesory_part.productName=accesory_part_params[:productName].capitalize
    @accesory_part.productTradeMark=accesory_part_params[:productTradeMark].upcase
    respond_to do |format|
      if @accesory_part.save
        format.html { redirect_to @accesory_part, notice: 'Accesorio - Repuesto fue creado correctamente.' }
        format.json { render :show, status: :created, location: @accesory_part }
      else
        format.html { render :new }
        format.json { render json: @accesory_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @accesory_part.update(accesory_part_params)
        format.html { redirect_to @accesory_part, notice: 'Accesorio - Repuesto modificado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @accesory_part }
      else
        format.html { render :edit }
        format.json { render json: @accesory_part.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    #@accesory_part.destroy
    respond_to do |format|
      if @accesory_part.productStatus==true
        format.html { redirect_to accesory_parts_url, notice: 'Accesorio/repuesto deshabilitado.' }
        @accesory_part.productStatus=false
      else
        format.html { redirect_to accesory_parts_url, notice: 'El accesorio/repuesto ha sido habilitado.' }
        @accesory_part.productStatus=true
      end
      format.json { head :no_content }
    end
    @accesory_part.save
  end

  private
  
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:accesory_part).permit(:productId, :productReference, :productName, :productTradeMark, :image, :productPrice, :productStatus, :productDescription, :typeElement)
  end
  def generateReport(elements)
    pdf = PDF::Writer.new
    pdf.select_font "Times-Roman"
    pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
    pdf.text "Reporte de Repuestos y accesorios", :font_size => 40, :justification => :center
    pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
    elements.each do |item|  
      pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
      pdf.text " "
      pdf.text "ID PRODUCTO: "+ item.productId.to_s, :font_size =>15
      pdf.text "REFERENCIA: "+item.productReference.to_s, :font_size => 15
      pdf.text "NOMBRE: " +item.productName.to_s, :font_size => 15
      pdf.text "MARCA: "+ item.productTradeMark.to_s, :font_size => 15
      pdf.text "PRECIO: "+ item.productPrice.to_s, :font_size => 15
      pdf.text "DESCRIPCION: "+item.productDescription, :font_size => 15, :justification => :justify
      pdf.text "TIPO ELEMENTO: "+item.typeElement.to_s, :font_size => 15, :justification => :justify
      if item.productStatus==true 
        pdf.text "ESTADO: Habilitado", :font_size => 15, :justification => :rigth
      else
        pdf.text "ESTADO: Deshabilitado", :font_size => 15, :justification => :rigth
      end
    end
    pdf.render
    send_data pdf.render, :filename => 'articulos_y_accesorios.pdf', :type => 'application/pdf', :disposition => 'inline'
  end
end
