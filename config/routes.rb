IdealMe::Application.routes.draw do

  get "activities/new"
  get "activities/create"
  get "activities/show"
  get "activities/edit"
  get "site/index"
  root :to => "site#index"

  devise_for :users

end
