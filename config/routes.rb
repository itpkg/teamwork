Teamwork::Engine.routes.draw do

  get 'home'=>'home#index'

  resources :projects
  resources :stories
  resources :tags
  resources :comments
  resources :documents
  resources :calendars

  resources :excels do

  end

end
