Rails.application.routes.draw do
  get '/', to: 'site#home', as: 'home'
  get '/show/calendar', to: 'bookings#show_calendar', as: 'calendar'

  namespace :api do
    post 'bookings/show_by_day', to: 'bookings#show_by_day' 
    post 'bookings/booked', to: 'bookings#booked'
    post 'bookings/add', to: 'bookings#add_employee'
    resources :bookings do
      resources :employees

    end
    resources :employees do
       resources :bookings
       post '/add', to: 'employees#add_booking'
    end
  end
    # 
    
  
  # get '/bookings/pepe', to: 'bookings#pepe_el_pollo'
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
