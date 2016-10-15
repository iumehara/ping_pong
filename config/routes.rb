Rails.application.routes.draw do
  resources :tournaments do
    resources :players
  end
end
