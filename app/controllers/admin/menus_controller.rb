class Admin::MenusController < ApplicationController
  before_action :authenticate_admin!

  def index
    @menus = Menu.all
    @genres = Genre.all
  end

  def show
    @menu = Menu.find(params[:id])
    cooks = Cook.where(menu_id: @menu.id)
    @cooks = cooks.order(cooks_count: :ASC)
    @comment = Comment.new
    @genres = Genre.all
  end

  def edit
    @menu = Menu.find(params[:id])
  end

  def update
    @menu = Menu.find(params[:id])
    if  @menu.update(menus_params)
      redirect_to admin_menu_path(@menu)
    else
      render 'edit'
    end

  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to admin_users_path
  end

  def search
    @genre = Genre.find(params[:format])
    @genres = Genre.all
  end

  private

  def menus_params
    params.require(:menu).permit(:image, :name, :explanation, :user_id, :genre_id,
    materials_attributes: [:id, :name, :weigh, :_destroy],
    cooks_attributes: [:id, :cooks_count, :text, :cook_image, :_destroy])
  end

end
