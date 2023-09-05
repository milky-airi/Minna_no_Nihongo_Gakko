Rails.application.routes.draw do

  namespace :public do
    get 'went_schools/new'
    get 'went_schools/edit'
  end
  devise_for :users,skip: [:passwords], controllers: {
    registrations: "public/registrations",
    sessions: 'public/sessions'
  }

  devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
  }

  # 管理者側
  namespace :admin do
    root to: 'homes#top'
    resources :users, only: [:index, :show, :edit, :update]
    resources :alerts, only: [:index, :edit, :update]
    resources :reviews, only: [:show, :index, :edit, :update] do
      collection do
        get '/individual/:user_id', action: :individual, as: 'individual'
      end
    end
    resources :courses
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
    resources :reviews do
      collection do
        # get 'individual'
        get '/individual/:user_id', action: :individual, as: 'individual'
      end
    end
    resources :comments, only: [:create, :update, :destroy]
    resources :schools, only: [:index, :show] do
      resource :favorites, only: [:create, :destroy]
    end
    get '/search' => 'searches#search'
    get '/detail_search' => 'detail_searches#detail_search'
    resources :users, only: [:show, :edit, :update] do
      get :favorited, on: :collection
      collection do
        patch 'quit'
        get 'confirm_quit'
      end
    end
    resources :went_schools, only: [:new, :create, :edit, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
