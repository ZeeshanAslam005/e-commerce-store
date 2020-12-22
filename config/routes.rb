Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    invitations: 'users/invitations'
  }

  devise_scope :user do
    authenticated :user, lambda {|u| u.type == "Buyer" || "Seller"} do
      root 'products#index', as: :authenticated_root
    end

    unauthenticated do
      root 'devise/sessions#new', as: :unauthenticated_root
    end
  end
  
  concern :attachable do
    resources :attachments, only: :create
  end
  
  resources :products, concerns: [:attachable] do
    member do 
     post 'approve'
     post :disapprove
    end
    collection do
      get :seller_product
    end
  end
  resources :users, only: %i[index show]
  resources :carts, only: %i[index] do 
    member do 
      post :add_to
    end
  end
  
  resources :favourites, only: %i[index] do 
    member do 
      post :add_to
    end
  end
end
