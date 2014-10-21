class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  
  before_filter :authenticate_user!
  def index
    @clients=Client.all
    respond_to do |format|
      format.html
      format.pdf do
        generateReport(@clients)
      end
    end

  end

  def show
    @sales = Sale.where(:clientId => @client.personId)
  end

  def new
    @client = Client.new

  end

  def edit
  end

  def create
    @client = Client.new(client_params)
    if Client.all.nil?
      @client.personId=1
    else
      @client.personId = Client.all.count+1
    end
    @client.personStatus=true
    @client.personName=client_params[:personName].titleize
    @client.lastName=client_params[:lastName].titleize
    @client.save
    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: 'Cliente creado correctamente.' }
        format.json { render :show, status: :created, location: @client }
      else
        format.html { render :new }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
     respond_to do |format|
      if @client.update(client_params)
        format.html { redirect_to @client, notice: 'El cliente se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @client }

      else
        format.html { render :edit }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    #@client.destroy
    respond_to do |format|
      if @client.personStatus==true
        format.html { redirect_to clients_url, notice: 'El cliente se ha deshabilitado.' }
        @client.personStatus=false
        @client.save
      else
        format.html { redirect_to clients_url, notice: 'El cliente se ha habilitado.' }
        @client.personStatus=true
        @client.save
      end
      format.json { head :no_content }
    end
    
  end

  private
  def set_client
    @client = Client.find(params[:id])
  end

  def client_params
    params.require(:client).permit(:personId, :document, :personName, :lastName, :telephone, :personStatus, :birthDay, :publicity, :email)
  end
  def generateReport(elements)
    pdf = PDF::Writer.new
    pdf.select_font "Times-Roman"
    pdf.image "public/images/logo.jpg", :justification => :center, :resize => 0.4
    pdf.text "Reporte de Clientes", :font_size => 40, :justification => :center
    pdf.text "Generado el "+ (Time.now()).strftime(" %b %d, %Y").to_s, :font_size => 15, :justification => :center
    elements.each do |item|  
      pdf.text "______________________________________________________", :font_size=>20 , :justification => :center
      pdf.text " "
      pdf.text "ID PERSONA: "+ item.personId.to_s, :font_size =>15
      pdf.text "DOCUMENTO: "+item.document.to_s, :font_size => 15
      pdf.text "NOMBRE: " +item.personName.to_s, :font_size => 15
      pdf.text "APELLIDO: "+ item.lastName.to_s, :font_size => 15
      pdf.text "TELEFONO: "+ item.telephone.to_s, :font_size => 15
      pdf.text "FECHA DE NACIMIENTO: "+item.birthDay.to_s, :font_size => 15, :justification => :justify
      pdf.text "CORREO ELECTRONICO: "+item.email.to_s, :font_size => 15, :justification => :justify
      if item.publicity==true 
        pdf.text "PUBLICIDAD PERMITIDA: Si", :font_size => 15, :justification => :justify
      else
        pdf.text "PUBLICIDAD PERMITIDA: No", :font_size => 15, :justification => :justify
      end
      if item.personStatus==true 
        pdf.text "ESTADO: Habilitado", :font_size => 15, :justification => :rigth
      else
        pdf.text "ESTADO: Deshabilitado", :font_size => 15, :justification => :rigth
      end
    end
    pdf.render
    send_data pdf.render, :filename => 'Clientes.pdf', :type => 'application/pdf', :disposition => 'inline'
  end
end
