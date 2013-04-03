Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index, :show] do
      collection do
        get 'soon'
        get 'today' 
        get 'archive'       => 'events#archive'
        get 'archive/:date' => 'events#archive'
        get ':type'   => 'events#index', :constraints => {:type => /[a-z]+/}
      end
    end
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :events, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => 'refinery/events' do
      resources :types, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
