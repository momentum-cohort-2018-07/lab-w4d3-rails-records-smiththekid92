Rails.application.routes.draw do
  get 'albums/index'

  resources :albums

  root 'albums#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
