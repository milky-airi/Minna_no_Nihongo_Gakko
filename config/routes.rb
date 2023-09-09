Rails.application.routes.draw do

  namespace :public do
    get 'contacts/new'
    get 'contacts/done'
  end
  namespace :public do
    get 'prefecture_search/prefecture_search'
  end

  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # ユーザーログイン
  devise_scope :user do
    post 'users/guest_sign_in', to: 'public/sessions#guest_sign_in'
  end

  # 管理者側
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :alerts, only: [:index, :edit, :update]
    resources :reviews, only: [:show, :index, :edit, :update]
    resources :courses, only: [:new, :create, :edit, :update, :destroy]
    get '/search' => 'searches#search'
    get '/detail_search' => 'detail_searches#detail_search'
    resources :searches, only: [:search]
    resources :schools
  end

  # ユーザー側
  scope module: :public do
    root to: 'homes#top'
    resources :alerts, only: [:new, :create] do
      collection do
        get 'thanks'
      end
    end
    resources :reviews, only: [:new, :create, :edit, :update, :show, :destroy] do
      collection do
        get '/individual/:user_id', action: :individual, as: 'individual'
      end
    end
    resources :comments, only: [:create, :destroy]
    resources :schools, only: [:show] do
      resource :favorites, only: [:create, :destroy]
    end
    get '/search' => 'searches#search'
    get '/detail_search' => 'detail_searches#detail_search'
    get '/prefecture_search' => 'prefecture_searches#prefecture_search'
    resources :users, only: [:show, :edit, :update] do
      get :favorited, on: :collection
      collection do
        patch 'quit'
        get 'confirm_quit'
      end
    end
    resources :went_schools, only: [:new, :create, :edit, :update, :destroy]
    resources :contacts, only: [:new, :create] do
      collection do
        post 'confirm'
        post 'back'
        get 'done'
      end
    end
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
