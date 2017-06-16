Rails.application.routes.draw do
    scope module: :v1, path: '/api/v1', defaults: {format: :json} do
      resources :game, param: :game_id, only: [:show, :create] do
        member do
          post :update
        end
      end
    end
end
