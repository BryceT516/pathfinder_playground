Rails.application.routes.draw do
  namespace :arena_api, defaults: {format: 'json'} do
    scope module: :v1 do
      resources :maps
      resources :executions do
        member do
          get 'frontier'
          get 'move_agent'
          get 'reset'
        end
      end
    end
  end

  root 'home#index'

  resources :executions

  resources :agents

  resources :maps do
    resources :polygons do
      resources :vertices
    end
  end
end
