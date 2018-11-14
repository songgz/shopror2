Rails.application.routes.draw do
  namespace :admin do
    get 'home/index'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :admin do
    resources :homes
  end


end
