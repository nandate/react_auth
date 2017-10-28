Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#create'
      delete 'logout' => 'sessions#destroy'
      get 'login' => 'sessions#new'
      get 'verify'  => 'sessions#verify_access_token'
      resources :users, param: :access_token do
        member do
          get :borrowed_products, :saling_products, :sold_products
        end
      end

      resources :products do
        member do
          get :get_seller
          get :get_borrower
          patch :rent
          patch :meet
        end
      end

    end
  end


end
