Rails.application.routes.draw do
  
  resources :sessions
  resources :rooms
  resources :room_messages

  root 'rooms#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
