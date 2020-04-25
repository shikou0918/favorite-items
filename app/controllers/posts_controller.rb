class PostsController < ApplicationController
  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    binding.pry
    if @post.save
      redirect_to post_path, notice: "投稿しました"
    else
      redirect_to new_post_path, alert: "投稿に失敗しました"
    end
  end

  private

  def post_params
    params.require(:post).permit(:name, :content, :image).merge(user_id: current_user.id)
  end
end
