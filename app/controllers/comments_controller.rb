class CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    @comment = Comment.create(comment_params)
    @comment.user_id = current_user.id
    respond_to do |format|
      format.html { redirect_to post_path(params[:post_id]) }
      format.json
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    if @comment.destroy
      render :destroy
    end
  end

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, post_id: params[:post_id])
  end
end
