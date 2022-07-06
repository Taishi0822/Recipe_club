class Public::UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(public_user_params)
    redirect_to user_path(current_user.id)
  end

  def unsubscribe
  end

  def withrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

  private

  def public_user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end

end
