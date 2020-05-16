class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @posts = Post.includes(:user).order('created_at DESC').page(params[:page]).per(9)
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.create(post_params)
    if @post.save
      redirect_to posts_path, notice: "投稿しました。"
    else
      flash.now[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(post_params)
      redirect_to posts_path, notice: "編集しました。"
    else
      flash.now[:alert] = "編集に失敗しました。"
      render :edit
    end
  end

  def show
    @post = Post.find(params[:id])
    @user = User.find_by(id: @post.user_id)
    @posts = @user.posts.page(params[:page]).order('created_at DESC').limit(5)
    @comments = @post.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
  end

  def destroy
    @post = Post.find(params[:id])
    render :destroy if @post.destroy
  end

  def search
    @posts = Post.search(params[:search]).order('created_at DESC').page(params[:page]).per(9)
    @posts_length = @posts.length
    @all_ranks = Post.find(Like.group(:post_id).order('count(post_id) desc').limit(5).pluck(:post_id))
  end

  private

  def post_params
    params.require(:post).permit(:name, :content, :image).merge(user_id: current_user.id)
  end
end
