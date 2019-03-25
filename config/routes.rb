Rails.application.routes.draw do
  #get 'users/show'

  #get 'posts/new'

  #get 'users/top'
  root 'users#top'
  get 'top', to:'users#top', as: :top
  get '/profile/edit', to: 'users#edit', as: 'profile_edit'
  get '/profile/:id', to: 'users#show', as: 'profile'
  get '/follower_list/:id', to: 'users#follower_list', as: 'follower_list'
  get '/follow_list/:id', to: 'users#follow_list', as: 'follow_list'
  get '/sign_up', to: 'users#sign_up', as: 'sign_up'
  get '/sign_in', to: 'users#sign_in', as: 'sign_in'
  get '/sign_out', to: 'users#sign_out', as: 'sign_out'
  get '/follow/:id', to: 'users#follow', as: 'follow'
  
  #get 'posts/new', to:'posts#new', as: :new_post
  resources :posts do
    member do
      # いいね
      get 'like', to: 'posts#like', as: :like
    end
  end


  post '/sign_up', to: 'users#sign_up_process'
  post '/sign_in', to: 'users#sign_in_process'
  post '/profile/edit', to: 'users#update'
  post '/posts/:id/comment', to: 'posts#comment', as: 'comment_post'
  
  #delete '/posts/:id', to: 'posts#destroy'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
