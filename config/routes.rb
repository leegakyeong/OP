Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # signin/signup customizing
  devise_scope :user do
    get '/signin' => 'devise/sessions#new'
    get '/signup' => 'devise/registrations#new'
  end

  resources :projects
  root 'projects#index'

  # request
  get '/projects/:id/apply' => 'projects#apply'
  delete '/projects/:id/apply' => 'projects#cancel_apply'

  # mypage
  get '/mypage' => 'user#mypage'
  get '/mypage/edit' => 'user#edit'
  post '/mypage/edit' => 'user#update'

  # my projects
  get '/myprojects' => 'user#myprojects'

  # user information
  get '/user/:id' => 'projects#user'

  # accept
  get '/projects/:id/accept/:requester_id' => 'projects#accept'
  delete '/projects/:id/accept/:requester_id' => 'projects#decline'

  # kick user
  delete '/projects/:id/:member_id' => 'projects#kick_user'

  # search
  get '/search' => 'projects#search', as: :search

  # project_like
  get '/projects/:id/like' => 'projects#like'
end
