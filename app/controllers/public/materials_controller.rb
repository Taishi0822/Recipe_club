class Public::MaterialsController < ApplicationController

  def index
    @materials = Material.all
    @material = Material.new
  end

  def create
   @material = Material.new(materials_params)
   if @material.save
      redirect_to new_menu_path
   else
      render 'index'
   end
  end

  def show
  end

  def edit
  end

  private
  def materials_params
    params.require(:material).permit(:name, :weigh, :menu_id)
  end
end
