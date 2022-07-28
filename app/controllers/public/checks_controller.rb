class Public::ChecksController < ApplicationController
  before_action :authenticate_user!

  def create
    @menu = Menu.find(params[:menu_id])
    @check = current_user.checks.new(menu_id: @menu.id)
    @check.save
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @check = current_user.checks.find_by(menu_id: @menu.id)
    @check.destroy
  end
end
