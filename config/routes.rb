Rails.application.routes.draw do
  root "blogs#index"

  resources :blogs do
    resources :entries
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
