Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root :to => "home#index"

  resources :products
  resources :categories

  namespace :admin do
    resources :categories
    resources :firms
    resources :categories, :only => [:index, :create, :update, :destroy] do 
      collection do
        post :bulk_update
      end  
    end    
    resources :products
    resources :users
  end  

end
