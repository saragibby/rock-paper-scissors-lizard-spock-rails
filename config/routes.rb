Rails.application.routes.draw do
  root 'games#index'

  resources :games

  namespace :api do
    namespace :v1 do
      resources :games
      resources :rounds
      resources :players
    end
  end

end
