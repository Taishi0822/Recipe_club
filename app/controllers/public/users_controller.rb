class Public::UsersController < ApplicationController
  before_action :authenticate_user!

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

  #退会機能
  def unsubscribe
  end

  def withrawal
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    reset_session
    redirect_to root_path
  end

 #いいね一覧
  def favorites
    @user = User.find(params[:id])
    favorites = Favorite.where(user_id: @user.id).pluck(:menu_id)
    @favorites_menu = Menu.find(favorites)
  end

 #作った一覧
  def checks
    @user = User.find(params[:id])
    checks = Favorite.where(user_id: @user.id).pluck(:menu_id)
    @checks_menu = Menu.find(checks)
  end

  private

  def public_user_params
    params.require(:user).permit(:profile_image, :name, :email)
  end

end
