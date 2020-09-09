class SalesStepsController < ApplicationController
	include Wicked::Wizard
	steps :quantity

	def show 
		@sale = Sale.last
		render_wizard
	end

	def update
		@sale = Sale.last
		@sale.attributes = sale_params
		render_wizard @sale
		@sale.update_attribute(:total_price, @sale.quantity_sold.to_i * (Stock.find(@sale.stock_id).ppv.to_i))
	end

	private
	def sale_params
      params.require(:sale).permit(:stock_id, :quantity_sold, :total_price)
    end

     def finish_wizard_path
  		redirect_to overview_path
	end
   
end
