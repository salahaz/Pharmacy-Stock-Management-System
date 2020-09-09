 class BlsController < ApplicationController

	$active_bl = nil
  def new
  	@bl = Bl.new
  end

  def nullify_active_bl
	$active_bl = nil
	end
	
  def create 
    @bl = Bl.new(bl_params)
    if @bl.save
      @bl = Bl.create(bl_params)
      flash[:success] = "Bon de livraison ajouté!"
	  $active_bl = Bl.last
      redirect_to stocks_new_path
    else
      render 'new'
    end
  end

  def index
    @bls = Bl.paginate(page: params[:page])
  end

  private 
    def bl_params
      params.require(:bl).permit(:provider_id, :order_id, :user_id, :finalpph)
    end
end
