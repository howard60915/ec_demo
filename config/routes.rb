Rails.application.routes.draw do
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }

  root :to => "home#index"
  resources :home, :only => :index
  resources :orders do
    post :checkout_pay2go, on: :member
  end
  post 'pay2go/return' => 'pay2go#return'
  post 'pay2go/notify' => 'pay2go#notify'

  resource :cart, only: :show do
    post :remove_item
  end  
  resources :categories, :only => :show do 
    resources :products, :controller => :category_products, only: :show do
      post :add_item, on: :member
      resources :comments, :controller=> 'product_comments', :only => :create
    end
    resources :comments, :controller=> 'product_comments', :only => :create
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
