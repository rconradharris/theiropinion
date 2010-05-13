ActionController::Routing::Routes.draw do |map|
  map.submit '/submit', :controller => 'submissions', :action => 'new'
  map.contact '/contact', :controller => 'notes', :action => 'new'
  map.about '/about', :controller => 'about', :action => 'show'


  #map.register '/register', :controller => 'users', :action => 'create'
  #map.signup '/signup', :controller => 'users', :action => 'new'
  map.resources :users
  map.resource :session

  map.resources :submissions
  map.resources :notes
  map.resources :articles

  map.logout '/admin/logout', :controller => 'sessions', :action => 'destroy'
  map.login '/admin/login', :controller => 'sessions', :action => 'new'
  map.namespace :admin do |admin|
    admin.resources :submissions, :collection => { :untriaged => :get }
    admin.resources :articles,
                    :collection => { :unposted => :get, :frontpage => :get }
    admin.resources :notes, :collection => { :unread => :get }
  end

  # You can have the root of your site routed with map.root -- just remember to delete public/index.html.
  map.root :controller => "articles", :action => "index"

  # See how all your routes lay out with "rake routes"

  # Install the default routes as the lowest priority.
  # Note: These default routes make all actions in every controller accessible via GET requests. You should
  # consider removing or commenting them out if you're using named routes and resources.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
