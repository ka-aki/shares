Rails.application.routes.draw do
  get 'groups/index'

  get 'expenses/index'

  get 'posts/index'

  get 'users/index'

  root :to => 'home#top'
  get 'about' => "home#about"
  resources :users
  resources :posts, except: :show 
  resources :expenses, except: :show
  resources :groups
  get 'expenses/food' => "expenses#food"
  get 'expenses/commodity' => "expenses#commodity"
  get 'expenses/utility' => "expenses#utility"
  get 'expenses/water' => "expenses#water"
  get 'login' => "users#login_form"
  post 'login' => "users#login"
  post 'logout' => "users#logout"

end

