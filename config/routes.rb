Rails.application.routes.draw do
  get 'finders/index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "home#index"
  resources :serviceareas, :vehicles, :finders
  devise_for :users, path: 'users',  controllers: {
    sessions: 'users/sessions'
  }

  devise_for :lcvowners, path: 'lcvowners',  controllers: {
    sessions: 'lcvowners/sessions'
  }

end
