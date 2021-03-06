Rails.application.routes.draw do
  namespace :admin do
    get 'admin' => 'homes#top'
    resources :customers, only:[:index, :show, :edit, :update]
    resources :orders, only:[:index, :show, :update]
    resources :order_details, only:[:update]
    resources :genres, only:[:create, :index, :edit, :update]
    resources :items, only:[:new, :create, :index, :show, :edit, :update, :destroy]
  end

  scope module: :public do
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
    resources :cart_items, only:[:index, :create, :update, :destroy] do
      collection do
        delete 'destroy_all'
      end
    end
    resource :customers, only:[:show] do
      collection do
        get 'unsbscribe'
        patch 'withdraw'
      end
    end
  end

  devise_for :customers, skip:[:passwords], controllers:{
    registrations: "customers/registrations",
    sessions: "customers/sessions"
  }
  devise_for :admins, skip:[:registrations, :passwords], controllers:{
    sessions: "admins/sessions"
  }
end
