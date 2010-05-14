ActionController::Routing::Routes.draw do |map|
  map.submit '/submit', :controller => 'submissions', :action => 'new'
  map.contact '/contact', :controller => 'notes', :action => 'new'
  map.about '/about', :controller => 'about', :action => 'show'
  map.tag '/t/:tag', :controller => 'articles', :action => 'tagged'

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
    admin.resources :submissions, :collection => { :triage => :get }
    admin.resources :articles,
                    :collection => { :unposted => :get }
    admin.resources :notes, :collection => { :unread => :get }
  end

  map.root :controller => "articles", :action => "index"
end
