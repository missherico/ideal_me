IdealMe::Application.routes.draw do

  get "users/dashboard"
  root :to => "site#index"

  get '/users/:id/dashboard', to: "users#dashboard"

  resources :users do
    resources :idealchart
  end

  resources :users do
    resources :realchart
  end

  resources :realchart do 
    resources :activities
  end


  devise_for :users

end
