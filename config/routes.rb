Rails.application.routes.draw do
  namespace :admin do
    get 'admin' => 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:show, :update]
    resources :genres, only:[:create, :index, :edit, :update]
    resources :items, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  end
  
  namespace :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :addresses, only:[:create, :index, :edit, :update, :destroy]
    resources :orders, only:[:new, :create, :index, :comfirm, :complete, :show]
    resources :cart_items, only:[:index, :create, :update, :destroy, :destroy_all]
    resources :items, only:[:index, :show]
    resources :customers, only:[:show, :edit, :edit, :unsbscribe, :withdraw]
  end
  
  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
