Rails.application.routes.draw do
  resources :guests
  resources :reservations do
    resources :guests
  end
  root to: redirect("https://hometime.io/")
end
