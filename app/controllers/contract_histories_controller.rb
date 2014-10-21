class ContractHistoriesController < ApplicationController
  before_action :set_contract_history, only: [:show, :edit, :update, :destroy]
  respond_to :html, :xml, :json
  before_filter :authenticate_user!
  def index
    @contract_histories = ContractHistory.all
    
  end

  def show
    
  end

  def new
    @contract_history = ContractHistory.new
    
  end

  def edit
  end

  def create
    @contract_history = ContractHistory.new(contract_history_params)
    @contract_history.save
    respond_to do |format|
      if @contract_history.save
        format.html { redirect_to @contract_history, notice: 'El contrato fue realizado correctamente.' }
        format.json { render :show, status: :created, location: @contract_history }
      else
        format.html { render :new }
        format.json { render json: @contract_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @contract_history.update(contract_history_params)
        format.html { redirect_to @contract_history, notice: 'El contrato se ha actualizado satisfactoriamente.' }
        format.json { render :show, status: :ok, location: @contract_history }
      else
        format.html { render :edit }
        format.json { render json: @contract_history.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @contract_history.destroy
    respond_to do |format|
      format.html { redirect_to contract_url, notice: 'El contrato se ha deshabilitado.' }
      format.json { head :no_content }
    end
  end

  private
    def set_contract_history
      @contract_history = ContractHistory.find(params[:id])
    end

    def contract_history_params
      params.require(:contract_history).permit(:personId, :contractDate, :finalContractDate)
    end
end
