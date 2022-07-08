class Public::MenusController < ApplicationController

  def new
    @menu = Menu.new
  end

  def create
    
  end

  def index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def menus_params
    params.require(:menus).permit(:name, :explanation, :user_id, :genre_id)
  end


end
