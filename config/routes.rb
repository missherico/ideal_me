IdealMe::Application.routes.draw do

 
  root :to => "site#index"
  devise_for :users

  get '/users/:id/dashboard', to: "users#dashboard", as: :user_dashboard


  resources :users do
    resources :idealchart
  end

  resources :users do
    resources :realchart
  end

  resources :realchart do 
    resources :activities
  end





end
