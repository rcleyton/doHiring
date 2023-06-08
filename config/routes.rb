Rails.application.routes.draw do
  get 'home', to: 'site/home#index'
  root to: 'site/home#index'
  
  devise_for :applicants
  devise_for :recruiters
  
  namespace :site do
    get 'home/index'
  end

  namespace :applicants_dashboard do
    get 'home/index'
    resources :profile, only: %i[ show new create edit update ]
    resources :vacancies do
      resources :candidatures, only: %i[ new create ]
    end
    resources :candidatures, only: %i[ index show ] 
  end
  
  namespace :recruiters_dashboard do
    get 'home/index'
    resources 'profile', only: %i[ show new create edit update ]
    resources :vacancies, only: %i[ show new create edit update ] 
    resources :proposals, only: %i[ index show ]

    resources :candidatures, only: %i[ show ] do
      resources :comments, only: %i[ new create ]
      resources :proposals, only: %i[ new create ]
      member do
        patch :favorite
        patch :not_favorite
        put :change_application_status
      end
    end
  end

  resources :vacancies, only: %i[ index show ]
end
