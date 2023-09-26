Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  namespace 'api' do
    namespace 'v1' do
      resources :vic_lgas, only: [:index, :show]
    end
  end
  resources :properties
  get "/api/v1/show_property/:id", :to => "api/v1/vic_lgas#show_property", :as => 'show_property'

end
