Rails.application.routes.draw do
  resources :contacts
  root to: "home#index"
end
