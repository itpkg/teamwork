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

  %w(sitemap rss).each { |a| get a => "home##{a}", constraints: {format: 'xml'} }
end
