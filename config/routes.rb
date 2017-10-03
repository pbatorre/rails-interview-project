Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      defaults format: :json do
        resources :questions, only: [:index, :show]
      end
    end
  end
end
