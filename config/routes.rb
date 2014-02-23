IdealMe::Application.routes.draw do

  root :to => "site#index"

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
