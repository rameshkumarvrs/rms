Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :reservations
  get 'get_reservation_list/id', to: "reservations#get_reservation_list"
end
