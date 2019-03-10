Rails.application.routes.draw do
  devise_for :users
  resources :usable_cards
  resources :cards
  resources :decks

  root "decks#index"

  get 'decks/:id/refresh_cards', to: 'decks#refresh_cards'
end
