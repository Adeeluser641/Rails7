Rails.application.routes.draw do

  resources :posts

  root 'pages#index'


#get "posts", to: "posts#index"

  devise_for :users


  resources :posts do
    resources :comments, only: [:create, :destroy]

  end

end
