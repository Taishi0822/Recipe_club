class Public::MenusController < ApplicationController

  def new
    @menu = Menu.new
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
  end

  def destroy
  end

  private

  def menus_params
    params.permit(:image, :name, :explanation, :user_id, :genre_id)
  end


end
