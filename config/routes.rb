Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # signin/signup customizing
  devise_scope :user do
    get '/signin' => 'devise/sessions#new'
    get '/signup' => 'devise/registrations#new'
  end

  # index
  get '/' => 'projects#index'
  post '/search' => 'projects#search'

  # create
  get '/new' => 'projects#new'
  post '/' => 'projects#create'

  # mypage
  get '/mypage' => 'user#mypage'
  get '/mypage/edit' => 'user#edit'
  post '/mypage/edit' => 'user#update'

  # read
  get '/:id' => 'projects#show'

  # update
  get '/:id/edit' => 'projects#edit'
  patch '/:id' => 'projects#update'

  # destroy
  delete '/:id' => 'projects#destroy'

  
end
