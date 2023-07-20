Rails.application.routes.draw do
  resources :spks
  resources :master_kapals
  root 'dashboard#index'  
  authenticated :user, ->(user) { user.admin? } do    
    get 'dashboard/pelabuhans'
    get 'dashboard/notices'
    get 'dashboard/comments'
    get 'dashboard/users'
    get 'dashboard/show_notice'
    get 'dashboard/routes'
  end
  get 'search', to: "search#index"
  get 'search/pelabuhan', to: "search#pelabuhan"
  get 'search/master_kapal', to: "search#master_kapal"
  resources :pelabuhans  
  devise_for :users, skip: [:sessions], controllers: {
    session: 'users/sessions',
    registrations: 'users/registrations'
  }
  as :user do
    get 'login', to: 'devise/sessions#new', as: :new_user_session    
    post 'login', to: 'devise/sessions#create', as: :user_session
    delete 'logout', to: 'devise/sessions#destroy', as: :destroy_user_session
    get 'register', to: 'devise/registrations#new', as: :new_user_registration_c    
  end

  resources :notices do 
    resources :comments
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")  
  # root "articles#index"  
end
