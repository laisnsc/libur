class UsersController < ApplicationController

  def edit;end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'User was successfully updated.'
    else
      flash.now[:error] = "Error updating user."
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :login_name, :birth_date, :email, :password, :settings)
  end
end
