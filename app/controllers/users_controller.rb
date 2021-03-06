class UsersController < ApplicationController

  def index; end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).order('created_at DESC').page(params[:page]).per(9)
    @liked_posts = @user.liked_posts.page(params[:page]).order('created_at DESC').page(params[:page]).per(9)
  end

  def following
    @user  = User.find(params[:id])
    @users = @user.followings
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
  end
end
