Blog::Application.routes.draw do
  	resources :articles
  	root 'welcome#index'
  	resources :subarticles

  	resources :articles do
  		resources :comments
	end

	resources :subarticles do
		member do
			put :add_subarticle
		end
	end

	get 'search', to: 'articles#search'



end