Rails.application.routes.draw do
  get '/', to: 'site#home', as: 'home'
  resources :schools
  resources :bookings
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
