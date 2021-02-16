Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :posts, only: [ :index, :show, :update , :create, :destroy ]
      resources :briefs, only: [ :index, :show, :update , :create, :destroy ]
      resources :articles, only: [ :index, :show, :update , :create, :destroy ]
      resources :user_briefs, only: [ :index, :show, :update , :create, :destroy ]
      resources :auditions, only: [ :index, :show, :update , :create, :destroy ]

    end
  end
end
