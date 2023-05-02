Rails.application.routes.draw do

  namespace :site do
    get 'home/index'
  end

  get 'home', to: 'site/home#index'
  root to: 'site/home#index'
  
end
