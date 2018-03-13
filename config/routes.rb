Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      namespace :merchants do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
      end
      get '/merchants', to: "merchants#index"
      get '/merchants/:id', to:"merchants#show"

      namespace :transactions do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
      end
      get '/transactions', to: "transactions#index"
      get '/transactions/:id', to: "transactions#show"

      namespace :customers do
        get '/find', to: "search#show"
        get '/find_all', to: "search#index"
        get '/random', to: "random#show"
      end
      get '/customers', to: "customers#index"
      get '/customers/:id', to: "customers#show"
    end
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace :invoices do
        get "/find" => "search#show"
        get "/find_all" => "search#index"
        get "/random" => "random#show"
      end
      resources :invoices, only: [:index, :show]
      resources :items, only: [:index, :show]
    end
  end
end
