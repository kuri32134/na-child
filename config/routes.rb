Rails.application.routes.draw do


  root to: 'public/homes#top'

  namespace :leader do
    resources :users, only:[:show, :edit, :update]
    resources :posts do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  namespace :admin do
    get 'homes/top'
    get 'dashboards/index'
    resources :users, only: [:destroy]
    resources :leaders, only: [:index, :create, :destroy]
  end

  namespace :public do
    get 'homes/about'
    resources :users, only: [:show, :edit, :update, :destroy]
    resources :posts, only: [:index, :show] do
      resources :post_comments, only: [:create, :destroy]
    end
  end

  devise_for :leaders, skip: [:registrations], controllers: {
  sessions: "leader/sessions"
}

  devise_for :admin, skip: [:registrations], controllers: {
  sessions: "admin/sessions"
}

  devise_for :users, controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}

get "search" => "searches#search"
get "retrieval" => "searches#retrieval"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
