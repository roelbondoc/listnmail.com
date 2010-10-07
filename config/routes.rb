ActionController::Routing::Routes.draw do |map|
  map.root :controller => :home, :action => :index
  map.resources :suppressions, :only => [:new,:create,:show]
  map.resources :lists, :only => [:new,:create,:show] do |list|
    list.resources :recipients
  end
  map.connect '/check_mail', :controller => 'home', :action => :check_mail
end
