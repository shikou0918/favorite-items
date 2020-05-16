class UsersController < ApplicationController
  # before_action :set_user

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

  # def set_user
  #   @user = User.find(params[:id])
  # end
end
