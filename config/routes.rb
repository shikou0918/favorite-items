Rails.application.routes.draw do
  root "home#top"
  
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :posts do
     collection do
      get 'search'
     end
    resources :comments
    resources :likes, only: %i[create destroy]
  end
  
  

  devise_for :users, controllers: { registrations: 'users/registrations' }
  devise_scope :user do
    post 'users/guest_sign_in' => 'users/sessions#new_guest'
  end
  resources :users, only: %i[edit show] do
    member do
      get :following, :followers
    end
  end

  resources :relationships, only: [:create, :destroy]
end
