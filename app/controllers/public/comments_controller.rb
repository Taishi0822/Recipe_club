class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @menu = Menu.find(params[:menu_id])
    @comment = current_user.comments.new(comment_params)
    @comment.menu_id = @menu.id
    if @comment.save
      render :menu_comment
    else
      render :error
    end
  end

  def destroy
    @menu = Menu.find(params[:menu_id])
    @comment = Comment.find_by(id: params[:id], menu_id: params[:menu_id])
    @comment.destroy
    render :menu_comment
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end

end
