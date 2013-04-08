Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index, :show] do
      collection do
        get 'dates', :format => :json
        get 'soon'
        get 'today' 
        get ':date'       => 'events#index', :constraints => {:date => /\d{4}-\d{2}-\d{2}/}, :as => 'by_date'
        get ':type'       => 'events#index', :constraints => {:type => /[a-z]+/}, :as => 'by_type'
        get ':type/:date' => 'events#index', :constraints => {:type => /[a-z]+/, :date => /\d{4}-\d{2}-\d{2}/}, :as => 'by_type_date'
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
