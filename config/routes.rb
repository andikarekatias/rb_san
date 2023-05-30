Rails.application.routes.draw do
  resources :notices
  resources :pelabuhans
  root 'dashboard#index'
  devise_for :users, skip: [:sessions], controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session    
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session    
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")  
  # root "articles#index"  
end
