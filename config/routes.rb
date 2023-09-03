Rails.application.routes.draw do

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
    resources :alerts, only: [:index, :show]
    patch '/alerts/:id/done' => 'alerts#done', as: "alerts_done"
    resources :reviews, only: [:index]
    get   '/reviews/:member_id' => 'reviews#individual', as: "individual_reviews"
    patch '/reviews/:id/close' => 'reviews#close', as: "review_close"
    resources :cources
    get '/search' => 'searches#search'
    get '/detail_search' => 'detail_searches#detail_search'
    resources :searches, only: [:search]
    resources :schools
    patch '/schools/:id/close' => 'schools#close', as: "school_close"
    resources :comments, only: [:index]
    patch '/comments/:id/close' => 'comments#close', as: "comment_close"
  end

  # ユーザー側
  scope module: :public do
    root to: 'homes#top'
    resources :favorites, only: [:create, :index, :destroy]
    resources :alerts, only: [:new, :create]
    get '/alerts/thanks' => 'alerts#thanks'
    resources :reviews
    resources :schools, only: [:index, :show]
    get '/search' => 'searches#search'
    get '/detail_search' => 'detail_searches#detail_search'
    resources :users, only: [:show, :edit, :update]
    get '/users/confirm_quit' => 'users#confirm_quit', as: "confirm_quit"
    patch '/users/quit' => 'users#quit', as: "quit"
    resources :comments, only: [:create, :update, :destroy]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
