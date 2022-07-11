class Public::MenusController < ApplicationController

  def new
    @menu = Menu.new
    @materials = @menu.materials.build
    @cooks = @menu.cooks.build

  end

  def create
    @menu = Menu.new(menus_params)
    @menu.user_id = current_user.id
    if @menu.save
     redirect_to menus_path
    else
     render 'new'
    end
  end

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
    redirect_to menu_path(@menu)
  end

  def destroy
    @menu = Menu.find(params[:id])
    @menu.destroy
    redirect_to user_path(current_user.id)
  end

  private

  def menus_params
    params.require(:menu).permit(:image, :name, :explanation, :user_id, :genre_id,
    materials_attributes: [:id, :name, :weigh, :_destroy],
    cooks_attributes: [:id, :cooks_count, :text, :cook_image, :_destroy])
  end


end
