Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'sessions#welcome'

get '/manager/signup' =>  'managers#new'
post '/manager/signup' =>  'managers#create'

get '/vendor/signup' =>  'vendors#new'
post '/vendor/signup' =>  'vendors#create'

get '/signin' =>  'sessions#new'
post '/signin' =>  'sessions#create'

get '/logout' => 'sessions#destroy'

resources :managers
resources :vendors

resources :products
resources :orders

end
