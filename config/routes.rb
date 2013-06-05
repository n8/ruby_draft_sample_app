OauthClient::Application.routes.draw do
  match '/auth/:provider/callback', to: 'sessions#create'
  match '/signout', to: 'sessions#destroy', as: 'signout'

  resources :documents do 
    member do 
      get :share
      get :create_savepoint
      get :show_savepoint
    end
  end
  root to: 'documents#index'
end
