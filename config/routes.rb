Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:new, :create, :edit, :update, :destroy]
  resource :session, only: [:create, :destroy, :new] 
  resources :subs do 
    resources :posts, only: [:new, :create]
  end
  resources :posts, except: [:index] do 
    resources :comments, only: [:new]
  end

  resources :comments, only: [:create] do
    resources :comments, only: [:new]
  end
  resources :comments, only:[:show]
end
