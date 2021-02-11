Rails.application.routes.draw do
  resources :guests
  resources :reservations
  root to: redirect("https://hometime.io/")
end
