Teamwork::Engine.routes.draw do

  root 'home#index'

  resources :projects do
    get   :tags,          to: 'projects#tags'
    patch :add_members,   to: 'projects#add_members'
    patch :remove_member, to: 'projects#remove_member'
  end
  resources :stories do
    patch  :update_story_status, to: 'stories#update_story_status'
    patch  :add_comment,         to: 'stories#add_comment'
    delete 'delete_comment/:id', to: 'stories#delete_comment', as: :delete_comment
  end
  resources :tags
  resources :comments
  resources :documents
  resources :calendars

  resources :excels do

  end

  get 'sitemap' => 'home#sitemap', constraints: {format: 'xml'}
end
