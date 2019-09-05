Rails.application.routes.draw do
  resources :bloggers, only: [:new, :create, :show]
  resources :destinations, only: [:show]
  resources :posts, only: [:new, :create, :show, :edit, :update]
  post '/posts/:id', to: 'posts#like', as: 'like_post'
end
