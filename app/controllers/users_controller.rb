class UsersController < ApplicationController
  before_action :set_user

  def index; end

  def show
    @user = User.find_by(id: params[:id])
    @posts = @user.posts.page(params[:page]).order('created_at DESC')
  end

  def set_user
    @user = User.find(params[:id])
  end
end
