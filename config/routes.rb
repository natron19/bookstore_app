Rails.application.routes.draw do

  root 'catalogs#index' 
  
  resources :authors
  resources :books, except: [:new] 
  resources :publishers, except: [:new] 

  get '/add_publisher', to: 'publishers#new', as: 'add_publisher'

  get '/add_book', to: 'books#new', as: 'add_book' 

end
