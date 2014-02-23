IdealMe::Application.routes.draw do

  get "site/index"
  root :to => "site#index"

  devise_for :users

end
