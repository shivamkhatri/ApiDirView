Rails.application.routes.draw do
  resources :filedetails
  resources :dirdetails
  get '/init' , to: 'application#update'
  get '/dirdetails/find/:name', to: 'dirdetails#index'
end
