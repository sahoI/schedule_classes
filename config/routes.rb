Rails.application.routes.draw do
  get 'registration/index' => 'registration#index'
  get 'registration/new' => 'registration#new'
  get 'registration/show' => 'registration#show'


  get 'registration/mon' => 'registration#mon'
  get 'registration/tues' => 'registration#tues'
  get 'registration/wednes' => 'registration#wednes'
  get 'registration/thurs' => 'registration#thurs'
  get 'registration/fri' => 'registration#fri'
  get 'registration/satur' => 'registration#satur'


  post 'registration/create' => 'registration#create'
  get 'user/new' => 'user#new'
  get 'user/show' => 'user#show'
  post 'user/create' => 'user#create'
  get 'login' => 'user#login_form'
  post 'login' => 'user#login'
  get 'search' => 'user#search'
  get 'user/:id' => 'user#index'

  get 'classlist/new' => 'classlist#new'
  post 'classlist/create' => 'classlist#create'
  get 'classlist/show' => 'classlist#show'

  get '/' => 'home#index'
  get 'wethreapp/index' => 'wethreapp#index'
  get 'wethreapp/show' => 'wethreapp#show'
  get 'wethreapp/scraipe' => 'wethreapp#scraipe'
  get '/classes/index' => 'classes/index'
  get '/' => 'classes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
