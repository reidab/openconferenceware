ActionController::Routing::Routes.draw do |map|
  # See how all your routes lay out with "rake routes"

  map.resources :comments, :path_prefix => 'proposals'

  map.resources :proposals do |proposals|
    proposals.resources :comments, :controller => 'comments'
  end

  map.manage_proposal_speakers '/proposals/manage_speakers/:id', :controller => 'proposals', :action => 'manage_speakers', :requirements => { :method => :post }
  map.search_proposal_speakers '/proposals/search_speakers/:id', :controller => 'proposals', :action => 'search_speakers', :requirements => { :method => :post }

  map.sessions '/sessions', :controller => 'proposals', :action => 'sessions_index'
  map.session '/sessions/:id', :controller => 'proposals', :action => 'session_show'

  map.resources :events, :member => { :speakers => :get } do |event|
    event.resources :proposals, :controller => 'proposals', :collection => 'stats'
    event.resources :tracks, :controller => 'tracks'
    event.resources :session_types
    event.resources :rooms
    event.resources :schedule_items
    event.sessions '/sessions', :controller => 'proposals', :action => 'sessions_index'
    event.schedule '/schedule', :controller => 'proposals', :action => 'schedule'
    event.formatted_schedule '/schedule.:format', :controller => 'proposals', :action => 'schedule'
    event.session '/sessions/:id', :controller => 'proposals', :action => 'session_show'
  end
  
  map.schedule '/schedule', :controller => 'proposals', :action => 'schedule'
  map.formatted_schedule '/schedule.:format', :controller => 'proposals', :action => 'schedule'

  map.namespace :manage do |manage|
    manage.root :controller => 'events', :action => 'index'
    manage.resources :events
    manage.resources :snippets
    manage.event_proposals '/events/:id/proposals', :controller => 'events', :action => 'proposals'
  end

  map.root :controller => "proposals"

  # For testing errors
  map.br3ak '/br3ak', :controller => 'proposals', :action => 'br3ak'
  map.m1ss  '/m1ss',  :controller => 'proposals', :action => 'm1ss'

  # Authentication
  map.resources :users, :member => { :complete_profile => :get, :proposals => :get }, :requirements => { :id => /\w+/ } do |user|
    user.favorites 'favorites', { :controller => 'user_favorites', :action => 'index' }
    user.formatted_favorites 'favorites.:format', { :controller => 'user_favorites', :action => 'index' }
    user.formatted_modify_favorites 'favorites/modify.:format', { :controller => 'user_favorites', :action => 'modify', :conditions => { :method => :put } }
  end
  map.open_id_complete '/browser_session', :controller => "browser_sessions", :action => "create", :requirements => { :method => :get }
  map.login            '/login',  :controller => 'browser_sessions', :action => 'new'
  map.logout           '/logout', :controller => 'browser_sessions', :action => 'destroy'
  map.admin            '/admin',  :controller => 'browser_sessions', :action => 'admin'
  map.resource  :browser_session, :collection => ["admin"]

  # Themes
  map.themeing

  # Install the default routes as the lowest priority.
  # TODO Disable default routes, they're dangerous.
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'

# {{{
  # The priority is based upon order of creation: first created -> highest priority.

  # Sample of regular route:
  #   map.connect 'products/:id', :controller => 'catalog', :action => 'view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   map.purchase 'products/:id/purchase', :controller => 'catalog', :action => 'purchase'
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   map.resources :products

  # Sample resource route with options:
  #   map.resources :products, :member => { :short => :get, :toggle => :post }, :collection => { :sold => :get }

  # Sample resource route with sub-resources:
  #   map.resources :products, :has_many => [ :comments, :sales ], :has_one => :seller

  # Sample resource route within a namespace:
  #   map.namespace :admin do |admin|
  #     # Directs /admin/products/* to Admin::ProductsController (app/controllers/admin/products_controller.rb)
  #     admin.resources :products
  #   end
# }}}
end
