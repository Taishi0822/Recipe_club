class Admin::MenusController < ApplicationController
  before_action :authenticate_admin!

  def index
    @menus = Menu.all
  end

  def show
    @menu = Menu.find(params[:id])
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    @menu.update(menus_params)
    redirect_to admin_menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_users_path
  end

  private

  def menus_params
    params.require(:menu).permit(:image, :name, :explanation, :user_id, :genre_id,
    materials_attributes: [:id, :name, :weigh, :_destroy],
    cooks_attributes: [:id, :cooks_count, :text, :cook_image, :_destroy])
  end

end
