class Public::HomesController < ApplicationController

  def top
    @genres = Genre.all.order(menu_id: "DESC")
    @menus = Menu.all.order(menu_id: "DESC")
  end
end
