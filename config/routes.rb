Rails.application.routes.draw do
  resources :shorten_urls, only: [:index, :create, :show]
  resources :users, only: [:create]
  post 'login', to: 'users#login'
  get '/:shortened_url', to: 'shorten_urls#redirect_to_original' 
end
