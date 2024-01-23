Rails.application.routes.draw do
  get 'comments/create'
  get 'comments/approve'
  root "blogs#index"

  resources :blogs do
    resources :entries do
      resources :comments, only: [:create] do
        member do
          patch :approve
        end
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
