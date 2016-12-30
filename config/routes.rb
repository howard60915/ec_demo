Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users

  root :to => "home#index"
  resource :cart, only: :show do
    post :remove_item
  end  
  resources :categories, :only => :show do 
    resources :products, :controller => :category_products, only: :show do
      post :add_item, on: :member
    end
  end

  namespace :admin do
    resources :categories, :only => [:index, :create, :update, :destroy] do 
      collection do
        post :bulk_update
      end  
    end    
    resources :firms, :only => [:index, :create, :update, :destroy] do 
      collection do
        post :bulk_update
      end  
    end    
    resources :products, :only => [:index, :create, :update, :destroy] do 
      collection do
        post :bulk_update
      end
    end
    resources :users, :only => [:index, :update, :destroy] do 
      collection do
        post :bulk_update
      end
    end   
  end  

end
