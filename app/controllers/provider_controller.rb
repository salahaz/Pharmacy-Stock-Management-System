class ProviderController < ApplicationController

def new
    @provider = Provider.new
  end
 
  def show
    @provider = Provider.find(params[:id])
  end

  def index
    @provider = Provider.paginate(page: params[:page], per_page:20)
  end
  
   def create
  	@provider = Provider.new(provider_params)
  	if @provider.save
  		flash[:success] = "Inscription avec succés!"
  		redirect_to '/providers'
  	else 
  		render 'new'
  	end
  end
  
  
  private
  	def provider_params
  		params.require(:provider).permit(:name,:address,:phone)
  	end
	
	
end
