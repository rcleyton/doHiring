Rails.application.routes.draw do

  devise_for :applicants
  devise_for :recruiters
  namespace :site do
    get 'home/index'
  end

  get 'home', to: 'site/home#index'
  root to: 'site/home#index'
  
end
