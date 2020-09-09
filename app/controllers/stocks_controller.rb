class StocksController < ApplicationController
  
  def new
  	@stock = Stock.new
  end

  def create
  	@stock = Stock.new(stock_params)
  	if @stock.save
      @stock.update(medicine_name: Medicine.find(@stock.medicine_id).name)

      if @stock.pph >= 1000
        @stock.update(ppv: (pph + 400))
      else
        @stock.update(ppv: (@stock.pph + @stock.pph * (33.93 / 100)))
      end 
  		flash[:success] = "Added to Stock!"
		if params[:subaction] == 1
  		redirect_to stocks_new_path
		else
		$active_bl = nil
		redirect_to "/"
		end
  	else
  		render 'new'
  	end
  end

  def index
    @stocks = Stock.paginate(page: params[:page])
	@near_expired = Stock.where(expiration: (Time.now.midnight - 10.day)..Time.now.midnight + 10.day )
	@last_arrived = Stock.where(bl_id: Bl.last.id)
  end


  private 
    def stock_params
      params.require(:stock).permit(:bl_id, :medicine_id, :medicine_qt, :qt_sold, :pph, :ppv, :expiration)
    end
      
  
end
