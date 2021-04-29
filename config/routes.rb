Rails.application.routes.draw do
  root to: 'pages#home'

  scope :api, defaults: { format: :json } do
    devise_for :users
  end

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show]

      resources :posts, only: [ :index, :show, :update , :create, :destroy ]
      resources :briefs, only: [ :index, :show, :update , :create, :destroy ]
      resources :articles, only: [ :index, :show, :update , :create, :destroy ]
      resources :user_briefs, only: [ :index, :show, :update , :create, :destroy ]
      resources :auditions, only: [ :index, :show, :update , :create, :destroy ]
    end
  end
end

