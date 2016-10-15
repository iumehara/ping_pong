Rails.application.routes.draw do
  resources :tournaments do
    resources :players
    post 'generate_teams', to: 'services#generate_teams'
  end
end
