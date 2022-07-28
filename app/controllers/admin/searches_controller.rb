class Admin::SearchesController < ApplicationController
  def search
    @range = params[:range]
    @menus = Menu.looks(params[:search], params[:word])
    @genres = Genre.all
  end
end
