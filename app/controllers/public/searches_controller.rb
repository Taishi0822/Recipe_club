class Public::SearchesController < ApplicationController
   before_action :authenticate_user!

  def search
    @range = params[:range]
    @menus = Menu.looks(params[:search], params[:word])
  end
end
