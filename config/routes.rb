Rails.application.routes.draw do
  root "articles#index"
  get 'articles/myarticles' ,to: "articles#myarticles"
  devise_for :users
  resources :articles
end
