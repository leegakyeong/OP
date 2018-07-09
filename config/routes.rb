Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # index
  get '/' => 'projects#index'

  # create
  get '/new' => 'projects#new'
  post '/' => 'projects#create'

  # read
  get '/:id' => 'projects#show'

  # update
  get '/:id/edit' => 'projects#edit'
  patch '/:id' => 'projects#update'

  # destroy
  delete '/:id' => 'projects#destroy'
end
