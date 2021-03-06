Rails.application.routes.draw do
  get '/tagged', to: "children#tagged", as: :tagged
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :children do
    resources :events, only: [:create]
  end
  resources :events, only: [:update, :destroy]
  resources :activities, only: [:show]
  resources :gifts, only: [:show]
end
