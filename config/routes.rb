Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      get '/backgrounds', to: 'endpoints#backgrounds'
      get '/forecast', to: 'endpoints#index'
    end
  end
end
