Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/' => 'projects#index'

  get '/new' => 'projects#new'
  post '/' => 'projects#create'

  get '/:id' => 'projects#show'

  delete '/:id' => 'projects#destroy'

  #delete '/:id' => 'projects#destroy'
end
