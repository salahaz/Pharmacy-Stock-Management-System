class UsersController < ApplicationController
  before_action :logged_in_user, only: [:destroy, :index]
  before_action :admin_user, only: :destroy

  def index
  	@users = User.paginate(page: params[:page])
  end
 
  def show
  	@user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

  def create
  	@user = User.new(user_params)
  	if @user.save
      if @user.occupation == "Admin"
        @user.admin = true
      elsif @user.occupation == "Phamacist"
        #
      else
        #
      end

  		flash[:success] = "Sign-Up Successful!"
  		redirect_to @user
  	else 
  		render 'new'
  	end
  end

  def destroy 
    User.find(params[:id]).destroy
    flash[:success] = "User Deleted"
    redirect_to employees_path
  end

  private
  	def user_params
  		params.require(:user).permit(:name, :occupation, :password, :password_confirmation)
  	end

    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to root_path
      end
    end

    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(overview_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to(overview_path) unless current_user.admin?
    end
end
