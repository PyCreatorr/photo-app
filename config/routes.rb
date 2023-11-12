Rails.application.routes.draw do
  # we say devise to show first for controllers registrations into our registrations_controller.rb.
  # To overwrite the devise controllers function create. And after that, show all others functions in devise.
  # devise_for :users, :controllers => { :registrations => 'registrations' }
  devise_for :users
  root 'welcome#index'
  get 'pricing', to: 'static_pages#pricing'

  post "checkout/create", to: "checkout#create", as: "checkout_create"

  post "billing_portal/create", to: "billing_portal#create", as: "billing_portal_create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # resources :blog_posts, except: [:get]
  
  # get "blog_posts/:id", to: "blog_posts#show", as: "blog_posts_show"

  resources :blog_posts do
    resource :cover_image, only: [:destroy], module: :blog_posts
  end

  # get "blog_posts/new", to: "blog_posts#new", as: :new_blog_post
  # patch "blog_posts/:id", to: "blog_posts#update"
  # put "blog_posts/:id", to: "blog_posts#update"
  # get "blog_posts/:id", to: "blog_posts#show", as: :blog_post  
  # get "blog_posts/:id/edit", to: "blog_posts#edit", as: :edit_blog_post  
  # post "blog_posts", to: "blog_posts#create", as: :blog_posts
  # delete "blog_posts/:id", to: "blog_posts#destroy"
  # get "blog_posts", to: "blog_posts#index"
  
  # blog_post_path(1) -> /blog_posts/1
  # blog_post_url(1) -> http://localhost:8001/blog_posts/1

  # Defines the root path route ("/")
  # root "articles#index"
end
