class SalesController < ApplicationController
  
  def new
  	@sale = Sale.new
  end

  def create
  	@sale = Sale.new(sale_params)
  	if @sale.save
  		flash[:success] = "étape 1 complétée avec succés"
  		redirect_to sales_quantity_path
  	else
  		#
  	end
  end

  def quantity
    @sale = Sale.last
    if @sale.update_attributes(sale_params)
      flash[:success] = "étape 1 complétée avec succés"
      redirect_to sales_path
    else
      render 'new'
    end

  end

  def index
    @sales = Sale.paginate(page: params[:page])
  end

  private
    def sale_params
        params.permit(:stock_id, :total_price, :quantity_sold)
    end
end
