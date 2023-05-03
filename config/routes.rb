Rails.application.routes.draw do
  get 'home', to: 'site/home#index'
  root to: 'site/home#index'

  devise_for :applicants
  devise_for :recruiters

  namespace :site do
    get 'home/index'
  end
  
  namespace :recruiters_dashboard do
    get 'home/index'
  end
  
end
