Rails.application.routes.draw do

  resources :authors

  root 'catalogs#index' 
end
