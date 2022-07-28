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
    if @user != current_user
      redirect_to user_path(current_user.id)
    else
      if @user.update(public_user_params)
        redirect_to user_path(current_user.id)
      else
        render 'edit'
      end
    end
  end

  #退会機能
  def unsubscribe
  end

  def withrawal
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to root_path
    else
      if @user.update(is_deleted: true)
        reset_session
        redirect_to root_path
      else
        render 'edit'
      end
    end
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
