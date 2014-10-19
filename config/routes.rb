Culpadati::Application.routes.draw do


  root to: 'posts#index'

  get 'post/:id/:title' => 'posts#show', as: 'post'

  get 'post/random' => 'posts#random', as: 'post_random'

  namespace :admin do

    resources :posts
    resources :users
    resources :hints

    get '/' => 'admin#index'

  end

  get 'login' => 'user_sessions#new', :as => :login
  post 'logout' => 'user_sessions#destroy', :as => :logout
  resources :user_sessions

  get 'hint' => 'hints#new', :as => :hints
  post 'hint' => 'hints#create'




  get "/404", :to => "errors#not_found"
  get "/422", :to => "errors#unacceptable"
  get "/500", :to => "errors#internal_error"




end
