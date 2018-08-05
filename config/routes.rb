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

  # # index
  # get '/' => 'projects#index'
  # post '/search' => 'projects#search'

  # # create
  # get '/new' => 'projects#new'
  # post '/' => 'projects#create'

  # # read
  # get '/project/:id' => 'projects#show'

  # # update
  # get '/project/:id/edit' => 'projects#edit'
  # patch '/project/:id' => 'projects#update'

  # # destroy
  # delete '/project/:id' => 'projects#destroy'

  # request
  get '/project/:id/apply' => 'projects#apply'
  delete '/project/:id/apply' => 'projects#cancel_apply'

  # mypage
  get '/mypage' => 'user#mypage'
  get '/mypage/edit' => 'user#edit'
  post '/mypage/edit' => 'user#update'

  # user information
  get '/user/:id' => 'projects#user'

  # accept
  get '/project/:project_id/accept/:requester_id' => 'projects#accept'
  delete '/project/:project_id/accept/:requester_id' => 'projects#decline'

  # kick user
  delete '/project/:project_id/:member_id' => 'projects#kick_user'
end
