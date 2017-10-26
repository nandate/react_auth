Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      post 'login' => 'sessions#create'
      delete 'logout' => 'sessions#destroy'
      get 'login' => 'sessions#new'
      get 'verify'  => 'sessions#verify_access_token'
      resources :users, param: :access_token
      resources :products
    end
  end


end
