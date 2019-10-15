Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get '/users/sign_up' => "devise/sessions#new", :as => :login
  end

  resources :users

  resources :organisations do
    member do
      get 'join'
      get 'leave'
    end
    resources :shifts
  end

  post '/organisations/:id' => 'organisations#edit'
  post '/shifts' => 'shifts#create'
end
