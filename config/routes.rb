Teamwork::Engine.routes.draw do
  resources :projects
  resources :stories
  resources :tags
  resources :comments
  resources :documents
  resources :calendars
end
