Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace 'api' do
    namespace 'v1' do
      get '/olympian_stats', to: 'stats#show'

      get '/olympians', to: 'olympians#index'

      get '/events/:id/medalists', to: 'event_medalists#index'

      get '/popularity', to: 'popularity#index'
      get '/percentage_wins', to: 'percentage_wins#index'

      get '/teams/:id/medalists', to: 'medalists#index'
      get :teams, to: 'teams#index'

      resources :events, only: [:index, :show]
    end
  end
end
