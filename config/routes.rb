Rails.application.routes.draw do
  resources :products
  namespace :admin do
    resources :categories do
      resources :products
    end
    resources :products do
      resources :variants
    end
  end
  #devise_for :users
  namespace :admin do
    resources :homes
    get 'home/index'
  end
  get '/admin' => 'admin/homes#index'
  devise_for :managers, module: 'managers'
  devise_for :customers, module: 'customers'



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

end
