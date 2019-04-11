Rails.application.routes.draw do
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
  
  get 'reset_password', to: 'sessions#reset_password_form'
  post 'reset_password', to: 'sessions#reset_password'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create]
  
  resources :bihins do
    collection do
      get :management
      get :result
      get :mypage
      get :member
    end
  end
end