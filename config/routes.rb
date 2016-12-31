Rails.application.routes.draw do
  devise_for :users

  namespace :admin do
    resources :dashboards
    resources :posts
    resources :post_details
  end

  resources :posts

  get 'dashboard/index'
  get "posts/new_release" => 'posts#new_release', :as => :new_release

  root 'dashboard#index'

  
end
