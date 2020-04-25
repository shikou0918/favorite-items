class CommentsController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    @comment = post.comments.build(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_to post_path(post.id), notice: "コメントしました"
    else
      redirect_to post_path(post.id), alert: "コメントに失敗しました"
    end
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
