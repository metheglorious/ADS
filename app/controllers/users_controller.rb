class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

    def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to root_path
    else
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end

  private

    def user_params
      params.require(:user).permit(:email, :password,
                                   :password_confirmation, :remember_me)
    end
end