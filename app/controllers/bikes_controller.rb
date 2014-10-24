class BikesController < ApplicationController
	before_action :set_product, only: [:show, :edit, :update, :destroy]
	respond_to :html, :xml, :json

	before_filter :authenticate_user!, only: [:new, :edit, :update, :destroy]
	def index
		@products = Product.all
		respond_to do |format|
			format.html
			format.pdf do
				generateReports(@products)
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

	end

	def update
		respond_to do |format|
			if @product.update(product_params)
				format.html { redirect_to @product, notice: 'La bicibleta se ha modificado satisfactoriamente.' }
				format.json { render :show, status: :ok, location: @product }
			else
				format.html { render :edit }
				format.json { render json: @product.errors, status: :unprocessable_entity }
			end
		end
	end

	def destroy
		respond_to do |format|
			if @product.productStatus==true
				format.html { redirect_to products_url, notice: 'La bicicleta ha sido deshabilitada.' }
				@product.productStatus=false
			else
				format.html { redirect_to products_url, notice: 'La bicicleta ha sido habilitada.' }
				@product.productStatus=true
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
		params.require(:product).permit(:productId, :productReference, :productName, :productTradeMark, :productPrice, :productStatus, :productDescription, :size, :gender, :image, :typeProduct)
	end

	def generateReports(elements)
		pdf = PDF::Writer.new
		pdf.select_font "Times-Roman"
		pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
		pdf.text "Reporte de Bicicletas", :font_size => 40, :justification => :center
		pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
		elements.each do |item|  
			pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
			pdf.text " "
			pdf.text "ID PRODUCTO: "+ item.productId.to_s, :font_size =>15
			pdf.text "REFERENCIA: "+item.productReference.to_s, :font_size => 15
			pdf.text "NOMBRE: " +item.productName.to_s, :font_size => 15
			pdf.text "MARCA: "+ item.productTradeMark.to_s, :font_size => 15
			pdf.text "PRECIO: "+ item.productPrice.to_s, :font_size => 15
			pdf.text "TIPO BICICLETA: "+ item.bikeType.to_s, :font_size => 15
			pdf.text "MEDIDAS: "+ item.measures.to_s, :font_size => 15
			pdf.text "DESCRIPCION: "+item.productDescription, :font_size => 15, :justification => :justify
			if item.productStatus==true 
				pdf.text "ESTADO: Habilitada", :font_size => 15, :justification => :rigth
			else
				pdf.text "ESTADO: Deshabilitada", :font_size => 15, :justification => :rigth
			end

		end
		pdf.render
		send_data pdf.render, :filename => 'Bicicletas.pdf', :type => 'application/pdf', :disposition => 'inline'

	end
end
