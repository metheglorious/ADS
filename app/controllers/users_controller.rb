class UsersController < ApplicationController
  #before_filter :authenticate_user!
  #load_and_authorize_resource
  
  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

    def create
    @user = User.new(user_params)
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    @user.delete
    redirect_to root_path
  end

  def signout
    sign_out
    redirect_to root_path
  end
  
  def index
    @users = User.paginate(page: params[:page])
  end
  
  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation, :remember_me)
    end
end