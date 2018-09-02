Rails.application.routes.draw do
  namespace :arena_api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :maps
      resources :executions
    end
  end

  root 'home#index'

  resources :executions

  resources :maps do
    resources :polygons do
      resources :vertices
    end
  end
end
