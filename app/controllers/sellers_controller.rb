class SellersController < ApplicationController
  before_action :set_seller, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  def index
   #@sellers = User.find(:all, :conditions => { :userType => 'Seller' })
   @sellers = Seller.all

   respond_to do |format|
    format.html
    format.pdf do
      generateReport(@sellers)
    end
  end
end

def show
  @sales = Sale.where(:sellerId => @seller.personId)
end

def new
  @seller = Seller.new

end

def edit
  @reset=false
end

def create
  @seller = Seller.new(seller_params)
  
  @seller.username=seller_params[:username].titleize
  @seller.userLastName=seller_params[:userLastName].titleize
  @seller.personId= User.all.count+1
  @seller.userType='Seller'
  @seller.status = 1
  @seller.password = "#{@seller.username}.#{@seller.userLastName}".downcase.gsub(/\s+/, "")
  @seller.save
  @user  =  User.new(
    :personId => @seller.personId,
    :username => @seller.username,
    :email =>  @seller.email , 
    :userLastName =>@seller.userLastName,
    :document => @seller.document,
    :telephone => @seller.telephone,
    :userType => @seller.userType,
    :status => @seller.status,
    :password =>  @seller.password,
    :password_confirmation => @seller.password)
  @user.save 
  respond_to do |format|
    if @user.save
      format.html { redirect_to @seller, notice: 'Vendedor creado correctamente.' }
      format.json { render :show, status: :created, location: @seller }
    else
      format.html { render :new }
      format.json { render json: @seller.errors, status: :unprocessable_entity }
    end
  end

end

def update

  @seller.update(seller_params)
  passwd="#{@seller.username}.#{@seller.userLastName}".downcase.gsub(/\s+/, "")
  if @reset==false
    @user  =  User.update(@seller.personId,
      :username => @seller.username,
      :email =>  @seller.email , 
      :userLastName =>@seller.userLastName,
      :document => @seller.document,
      :telephone => @seller.telephone)
  else 
    @user  =  User.update(@seller.personId,
      :username => @seller.username,
      :email =>  @seller.email , 
      :userLastName =>@seller.userLastName,
      :document => @seller.document,
      :telephone => @seller.telephone,
      :password => passwd,
      :password_confirmation=>passwd)
  end
  @user.save 
  respond_to do |format|
    if @user.save
      format.html { redirect_to @seller, notice: 'Vendedor actualizado correctamente.' }
      format.json { render :show, status: :created, location: @seller }
    else
      format.html { render :new }
      format.json { render json: @seller.errors, status: :unprocessable_entity }
    end
  end

end

def destroy
  #@seller.destroy
  respond_to do |format|
   if @seller.status==true
    format.html { redirect_to sellers_url, notice: 'El Vendedor ha sido deshabilitado.' }
    query="update users set status = 0 where personId="+@seller.personId.to_s
    @users=ActiveRecord::Base.connection.execute(query)
    @seller.status=false
  else
    format.html { redirect_to sellers_url, notice: 'El Vendedor ha sido habilitado.' }
    query="update users set status = 1 where personId="+@seller.personId.to_s
    @users=ActiveRecord::Base.connection.execute(query)
    @seller.status=true
  end
  @seller.save
  format.json { head :no_content }
end

end


end

private
def set_seller
  @seller = Seller.find(params[:id])
end

def seller_params
  params.require(:seller).permit(:personId, :document, :username, :userLastName, :email, :password, :password_confirmation, :telephone, :userType, :status)
end
def generateReport(elements)
  pdf = PDF::Writer.new
  pdf.select_font "Times-Roman"
  pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
  pdf.text "Reporte de Vendedores", :font_size => 40, :justification => :center
  pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
  elements.each do |item|  
    pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
    pdf.text " "
    pdf.text "ID PERSONA: "+ item.id.to_s, :font_size =>15
    pdf.text "DOCUMENTO: "+item.document.to_s, :font_size => 15
    pdf.text "NOMBRE: " +item.username.to_s, :font_size => 15
    pdf.text "APELLIDO: "+ item.userLastName.to_s, :font_size => 15
    pdf.text "TELEFONO: "+ item.telephone.to_s, :font_size => 15
    if item.status==true 
      pdf.text "ESTADO: Habilitado", :font_size => 15, :justification => :rigth
    else
      pdf.text "ESTADO: Deshabilitado", :font_size => 15, :justification => :rigth
    end
  end
  pdf.render
  send_data pdf.render, :filename => 'Vendedores.pdf', :type => 'application/pdf', :disposition => 'inline'
end

