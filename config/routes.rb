Rails.application.routes.draw do
  get 'likes/create'

  get 'likes/destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
     collection do
      get 'search'
    end
    resources :comments
    resources :likes, only: [:create, :destroy]
  end
  devise_for :users
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end
  root "home#top"
  resources :users, only: %i[edit show] do
  end
end