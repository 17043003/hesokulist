Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api, { format: 'json' } do
    namespace :v1 do
      get "/households/" => "households#index"
      get "/household/" => "households#show"
      post "/household/" => "households#create"
      delete "/household/" => "households#destroy"
    end
  end
end
