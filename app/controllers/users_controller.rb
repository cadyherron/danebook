class UsersController < ApplicationController

  def index
    @users = User.all
  end


  def new
    @user = User.new
  end


  def create
    @user = User.new(whitelisted_params)
    if @user.save
      flash[:success] = "User has been created"
      sign_in(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = "User was not created"
      redirect_to :new
    end
  end


  def show
    @user = @user.find(params[:id])
  end


  def edit
    @user = @user.find(params[:id])
  end


  def update
    @user = @user.find(params[:id])
    if @user.update(whitelisted_params)
      flash[:success] = "User has been updated"
      redirect_to user_path(@user)
    else
      flash[:error] = "User was not updated"
      render :edit
    end
  end


  def destroy
    @user = @user.find(params[:id])
    if @user.destroy
      flash[:success] = "User was deleted"
      sign_out(@user)
    else
      flash[:error] = "User was not deleted"
    end
    redirect_to root_path
  end







  private

  def whitelisted_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end