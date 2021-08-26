Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :children do
<<<<<<< HEAD
    resources :events, only: [:create, :update]
=======
    resources :events, only: [:create, :update, :destroy]
>>>>>>> master
  end
end
