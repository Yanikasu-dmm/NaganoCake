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
    resources :orders, only:[:new, :create, :index, :show] do
      collection do
        post 'confirm'
      end
      member do
        get 'complete'
      end
    end
    resources :items, only:[:index, :show]
    resources :cart_items, only:[:index, :create, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resources :customers, only:[:show, :edit, :edit] do
      collection do
        get 'unsbscribe'
        patch 'withdraw'
      end
    end
  end

  devise_for :customers
  devise_for :admins
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
