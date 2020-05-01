class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[nickname profile avatar])
    devise_parameter_sanitizer.permit(
      :account_update,
      keys: %i[nickname profile avatar avatar_cache remove_avatar]
    )
  end

  # 新規登録後に投稿一覧に遷移
  def after_sign_up_path_for(_resource)
    posts_path
  end

  # ログイン後に投稿一覧に遷移
  def after_sign_in_path_for(_resource)
    posts_path
  end

  # ログアウト後にトップページに遷移
  def after_sign_out_path_for(_resource)
    root_path
  end

    #アカウント編集後のリダイレクト先
  def after_update_path_for(resource)
    users_path(@user)
    
  end
end