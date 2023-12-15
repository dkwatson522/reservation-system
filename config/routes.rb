Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # setting home page
  # root "/api/V1/reservations#index"

  namespace 'api' do
    namespace 'v1' do
      resources :customers do
        resources :reservations, shallow: true
        resources :vehicles, shallow: true
      end
      resources :time_slots, only: [:index]
    end
  end

end
