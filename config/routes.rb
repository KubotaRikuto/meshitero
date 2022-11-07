Rails.application.routes.draw do

  root to: "homes#top"
  devise_for :users

  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    # resource　単数形にするとURLに/:idが含まれなくなる
    resource :favorites, only: [:create, :destroy]
    # post_commentsはpost_imagesに1:Nで紐づくデータなので親子関係になる。
    resources :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get 'homes/about' => 'homes#about', as: 'about'

end
