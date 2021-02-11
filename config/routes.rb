Rails.application.routes.draw do
  resources :reservations
  root to: redirect("https://hometime.io/")
end
