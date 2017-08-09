Rails.application.routes.draw do
  resources :filedetails
  resources :dirdetails
  get '/init' , to: 'application#update'
  get '/dirdetails/:path', to: 'dirdetails#index'
end
