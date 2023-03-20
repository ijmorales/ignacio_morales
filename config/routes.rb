Rails.application.routes.draw do
  root "homes#index"

  get "login", to: "sessions#new"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"

  namespace :experiments do
    resource :kanban_board, only: :show do
      resources :cards, only: :update, module: :kanban_boards
    end
  end
end
