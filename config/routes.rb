Teamwork::Engine.routes.draw do

  root 'home#index'

  resources :projects
  resources :stories
  resources :tags
  resources :comments
  resources :documents
  resources :calendars

  resources :excels do

  end

  get 'sitemap' => 'home#sitemap', constraints: {format: 'xml'}
end
