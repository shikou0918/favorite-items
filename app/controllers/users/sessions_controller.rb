class Users::SessionsController < Devise::SessionsController
  def new_guest
    user = User.find_or_create_by!(email: "guest@example.com", nickname: "ゲストユーザー") do |user|
      user.password = SecureRandom.urlsafe_base64
    end
    sign_in user
    redirect_to posts_path, notice: "ゲストユーザーとしてログインしました。"
  end
end
