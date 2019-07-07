Rails.application.routes.draw do


  namespace :api do
    namespace :v1 do

      resources :tag_notes
      resources :tag_articles
      resources :interview_contacts
      resources :user_companies
      resources :tags
      resources :articles
      resources :notes
      resources :contacts
      resources :interviews
      resources :apps
      resources :companies
      resources :jobs
      resources :users

      post '/login', to: 'auth#create'
      get '/profile', to: 'users#profile'
      # get '/current_user', to: 'auth#currentUser'
      post '/signup', to: 'auth#signup'
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
