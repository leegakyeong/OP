Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # index
  get '/' => 'projects#index'
  post '/search' => 'projects#search'

  # create
  get '/new' => 'projects#new'
  post '/' => 'projects#create'

  # read
  get ':id' => 'projects#show'

  # update
  get '/:id/edit' => 'projects#edit'
  patch '/:id' => 'projects#update'

  # destroy
  delete '/:id' => 'projects#destroy'

  # my page
  get '/mypage' => 'projects#show_mypage'

  # signup, signin <- 이렇게 하면 오류남 params[:id]로 받아져서..왜그럴까
  # devise_scope :user do
  #   get '/signin' => 'devise/sessions#new'
  #   get '/signup' => 'devise/registrations#new'
  # end
end
