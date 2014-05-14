Rails.application.routes.draw do
  root 'events#index'

  resources :events, except: :show do
    get :delete
  end
end
