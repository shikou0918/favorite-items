class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]
  
  def index
    @posts = Post.includes(:user).order('created_at DESC')
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました"
    else
      redirect_to new_post_path, alert: "投稿に失敗しました"
    end
  end

  def show
    @post = Post.find(params[:id])
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def search
    @posts = Post.search(params[:search])
    @posts_length = @posts.length
  end


  private

  def post_params
    params.require(:post).permit(:name, :content, :image).merge(user_id: current_user.id)
  end
end
