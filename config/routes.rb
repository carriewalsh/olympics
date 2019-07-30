Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      get '/olympian_stats', to: 'stats#show'

      get '/olympians', to: 'olympians#index'

      get '/events/:id/medalists', to: 'event_medalists#index'

      get '/popularity', to: 'popularity#index'

      resources :events, only: [:index, :show]
      get :teams, to: 'teams#index'
    end
  end
end
