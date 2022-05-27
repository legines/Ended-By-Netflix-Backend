Rails.application.routes.draw do
  resources :shows
  get '/genre_shows/:genre', to: 'shows#genre_shows'
  get '/search_shows', to: 'shows#search_shows'
  get '/all_shows', to: 'shows#all_shows'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
