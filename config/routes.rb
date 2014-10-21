Rails.application.routes.draw do
 get 'bike/index'
 

 get 'accesory_part/index'

 get 'bike/index'

 resources :products
 resources :products

 resources :sellers

 resources :sellers

  #get 'sellers/index'

  devise_for :users, :controllers =>{:registrations =>"my_devise/registrations"}

  root to: 'home#index'
  get 'catalog/index'
  
  resources :products

  resources :inventories

  resources :sales

  resources :items

  resources :clients

  resources :contract_histories

  resources :articles

  resources :equipment

  resources :bikes

  resources :accesory_parts

end
