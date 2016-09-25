Rails.application.routes.draw do
  get '/', to: 'site#home', as: 'home'
  get '/show/calendar', to: 'bookings#show_calendar', as: 'calendar'

  namespace :api do
    resources :employees do
      resources :bookings
      post '/booking/add', to: 'employees#add_booking'
    end
    resources :bookings do
      resources :employees
        post '/employee/add', to: 'bookings#add_employee'
    end
  end
  
  # get '/bookings/pepe', to: 'bookings#pepe_el_pollo'
  # get '/bookings/by_day', to: 'bookings#select_by_day'
  # post '/bookings/show_by_day', to: 'bookings#show_by_day'
  # resources :schools
  # resources :bookings
  # resources :schools do
  # 	resources :bookings
  # end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
