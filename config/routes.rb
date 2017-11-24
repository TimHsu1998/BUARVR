Rails.application.routes.draw do
  root "welcome#index"
  devise_for :users
  resources :news
  resources :meetings
  resources :aboutus
  resources :emailinglists
end
