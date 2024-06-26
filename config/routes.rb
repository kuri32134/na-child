Rails.application.routes.draw do
 
 
  root to: 'public/homes#top'
 
  namespace :leader do
    resources :users, only:[:show, :edit, :update]
    resources :posts
  end
  
  namespace :admin do
    get 'homes/top'
  end
 
  namespace :public do
    get 'homes/about'
    resources :users, only: [:show, :edit, :update]
    resources :posts, only: [:index, :show]
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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
