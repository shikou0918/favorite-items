Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end
  root "home#top"
end
