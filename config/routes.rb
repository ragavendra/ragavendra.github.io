Rails.application.routes.draw do

  get 'static_pages/home'
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/blog', to: 'static_pages#blog'
  get '/contact', to: 'static_pages#contact'
  get '/login', to: 'static_pages#login'
  get '/signup', to: 'users#new', as: 'signup'

	resources	:users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
	root 'static_pages#home'
end
