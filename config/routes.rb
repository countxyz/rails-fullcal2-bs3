Rails.application.routes.draw do
  root 'events#index'

  resources :events do
    get 'delete'
  end
end
