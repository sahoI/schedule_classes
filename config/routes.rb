Rails.application.routes.draw do
  get 'home/index' => 'home#index'
  get 'wethreapp/index' => 'wethreapp#index'
  get 'wethreapp/show' => 'wethreapp#show'
  get 'wethreapp/scraipe' => 'wethreapp#scraipe'
  get '/classes/index' => 'classes/index'
  get '/' => 'classes#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
