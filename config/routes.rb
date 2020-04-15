Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/profiles', to: 'profiles#index', as: "profiles"
  get '/profiles/new', to: 'profiles#new', as: "new_profile"
  post '/profiles', to: 'profiles#create'
  get "/profiles/:id", to: "profiles#show", as: 'profile'
  get '/profiles/:id/edit', to: "profiles#edit", as: "edit_profile"
  patch '/profiles/:id', to: "profiles#update"
  delete "/profiles/:id", to: "profiles#destroy"

  get '/blogs', to: 'blogs#index', as: "blogs"
  get '/blogs/new', to: 'blogs#new', as: "new_blog"
  post '/blogs', to: 'blogs#create'
  get "/blogs/:id", to: "blogs#show", as: 'blog'
  get '/blogs/:id/edit', to: "blogs#edit", as: "edit_blog"
  patch '/blogs/:id', to: "blogs#update"
  delete "/blogs/:id", to: "blogs#destroy"

  get '/posts', to: 'posts#index', as: "posts"
  get '/posts/new', to: 'posts#new', as: "new_post"
  post '/posts', to: 'posts#create'
  get "/posts/:id", to: "posts#show", as: 'post'
  get '/posts/:id/edit', to: "posts#edit", as: "edit_post"
  patch '/posts/:id', to: "posts#update"
  delete "/posts/:id", to: "posts#destroy"
  
end
