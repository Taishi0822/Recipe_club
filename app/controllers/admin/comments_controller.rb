class Admin::CommentsController < ApplicationController
  
  def destroy
    Comment.find_by(id: params[:id], menu_id: params[:menu_id]).destroy
    redirect_to menu_path(params[:menu_id])
  end
end
