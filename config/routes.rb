Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  resources :usable_cards

  resources :decks do
    member do
      put 'like', to: 'decks#upvote'
    end
  end

  resources :users
  get 'users/:id' => 'users#show'

  root "decks#index"

  get 'decks/:id/refresh_cards', to: 'decks#refresh_cards'
end
