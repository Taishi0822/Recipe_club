class Admin::CommentsController < ApplicationController
  
  def destroy
    @menu = Menu.find(params[:menu_id])
    @comment = Comment.find_by(id: params[:id], menu_id: params[:menu_id])
    @comment.destroy
    render :menu_comment
  end
end
