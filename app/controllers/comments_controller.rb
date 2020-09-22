class CommentsController < ApplicationController

  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @item = Item.find(params[:item_id])
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to item_path(@item)
    else
      render root_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: (params[:item_id]))
  end

end
