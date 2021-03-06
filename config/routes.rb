Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
root 'sessions#welcome'

get '/expensive_products' => 'products#expensive_products'
get '/manager/signup' =>  'managers#new'
post '/manager/signup' =>  'managers#create'

get '/vendor/signup' =>  'vendors#new'
post '/vendor/signup' =>  'vendors#create'

get '/signin' =>  'sessions#new'
post '/signin' =>  'sessions#create'

get '/logout' => 'sessions#destroy'
get '/auth/:provider/callback' => 'sessions#google'
resources :managers

resources :product_orders
resources :orders 

resources :vendors do
  resources :products, only: [:new, :show, :index]
end
resources :products

end
