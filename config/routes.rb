Rails.application.routes.draw do
  # 顧客用
# URL /customers/sign_in ...
devise_for :customers,skip: [:passwords], controllers: {
  registrations: "public/registrations",
  sessions: 'public/sessions'
}
scope module: :public do
  root to: "homes#top"
  get "/about" => "homes#about"
  resources :products, only: [:index, :show]
  get "customers/my_page" => "customers#show"
  get "customers/information/edit" => "customers#edit"
  patch "customers/information" => "customers#update"
  get "customers/withdrawal_check" => "customers#withdrawal_check"
  patch "customers/withdrawal" => "customers#withdrawal"
  delete "carts/destroy_all" => "carts#destroy_all"
  resources :carts, only: [:index, :update, :create, :destroy]
  resources :orders, only: [:new, :create, :index, :show]
  get "orders/check" => "orders#check"
  get "orders/thanx" => "orders#thanx"
  resources :orders, only: [:new, :create, :index, :show]
  resources :shopping_addresses, only: [:index, :edit, :create,:update, :destroy]
 end
# 管理者用
# URL /admin/sign_in ...
devise_for :admin, skip: [:registrations, :passwords] ,controllers: {
  sessions: "admin/sessions"
}
  namespace :admin do
   root to: 'homes#top'
   resources :products, only: [:index, :new, :create, :show, :edit, :update]
   resources :product_genres, only: [:index, :create, :edit, :update]
   resources :customers, only: [:index, :show, :edit, :update]
   resources :orders, only: [:show, :update]
   resources :order_details, only: [:update]
  end

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end