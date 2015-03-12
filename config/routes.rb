Teamwork::Engine.routes.draw do
  get 'home'=>'home#index'
  get 'controllers'=> 'home#controllers', format: :js

  resources :projects
  resources :stories
  resources :tags
  resources :comments
  resources :documents
  resources :calendars
end
