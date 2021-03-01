Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :notes, only: [:create, :index] do
    # resources :labels
  end
  post "/notes/:note_id/labels/:label_name", to: "note_labels#create"

  resource :ping, only: [:show], controller: "ping"
end
