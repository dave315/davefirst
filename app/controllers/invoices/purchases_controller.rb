class Invoices::PurchasesController < ApplicationController

  respond_to :html

  def index
    @purchases = Purchase.all
  end

  def show
 respond_with(@purchase)
  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new
    respond_with(@purchase)
  end

  def edit
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.invoice = @invoice
    
   @purchase.save
    respond_with(@purchase)
end
  def update
    @purchase.update(purchase_params)
    respond_with(@purchase)
  
  end

  def destroy
    @purchase.destroy
    respond_with(@purchase)
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:name, :category, :string, :quantity, :invoice_id)
    end
end