Rails.application.routes.draw do
  get 'user/show'
  devise_for :users
 
  
  root to: "items#index"
  resources :user
  resources :items do
    resources :orders
    resources :tags
    collection do
      get 'search'
    end
  



  end
end
