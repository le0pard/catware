Catware::Application.routes.draw do
  
  namespace :admin do
    resources :projects
    resources :users
    match "signin" => 'user_sessions#new', :as => :signin, :via => :get
    match "signin" => 'user_sessions#create', :as => :signin, :via => :post
    match "logout" => 'user_sessions#destroy', :as => :logout, :via => :get
    root :to => 'projects#index'
  end
  
  match "contacts" => 'contacts#index', :as => :contacts, :via => :get
  match "contacts" => 'contacts#create', :as => :contacts, :via => :post
  match "contacts/thank_you" => 'contacts#thank_you', :as => :thank_you_contacts, :via => :get
  match "services/mobile_news" => 'services#mobile_news', :as => :mobile_news_services, :via => :get
  match "services/mobile" => 'services#mobile', :as => :mobile_services, :via => :get
  match "services/web" => 'services#web', :as => :web_services, :via => :get
  match "projects/:slug" => 'projects#show', :as => :show_project, :via => :get
  match "projects" => 'projects#index', :as => :projects, :via => :get
  
  match "404", :to => 'errors#page_not_found', :as => :page_not_found
  match "*path", :to => 'errors#page_not_found'
  
  root :to => 'dashboard#index'
  
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id(.:format)))'
end
