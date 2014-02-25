IdealMe::Application.routes.draw do

 
  root :to => "site#index"
  devise_for :users

  get '/users/:id/dashboard', to: "users#dashboard", as: :user_dashboard

  resources :users do
    resources :ideal_charts
  end

  resources :users do
    resources :real_charts
  end

  resources :real_charts do 
    resources :activities
  end

end
