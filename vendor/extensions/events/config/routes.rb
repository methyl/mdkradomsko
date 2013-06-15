Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :events do
    resources :events, :path => '', :only => [:index, :show] do
      collection do
        get ':id' => 'events#show', :constraints => {id: /\d+/}
        get 'dates', :format => :json
        get 'dates/archive' => 'events#dates', :format => :json, :defaults => {:archive => true}
        get ':type/dates' => 'events#dates', :format => :json
        get ':type/dates/archive' => 'events#dates', :format => :json, :defaults => {:archive => true}
        get 'soon'
        get 'today'
        get 'archive'
        get 'elapsed'
        get ':date'         => 'events#index', :constraints => {:date => /\d{4}-\d{2}-\d{2}/}, :as => 'by_date'
        get ':type'         => 'events#index', :constraints => {:type => /[[:print:]]+/}, :as => 'by_type'
        get ':type/:date'   => 'events#index', :constraints => {:type => /[[:print:]]+/, :date => /\d{4}-\d{2}-\d{2}/}, :as => 'by_type_date'
        get ':type/soon'    => 'events#soon',     :constraints => {:type => /[[:print:]]+/}, :as => 'by_type_soon'
        get ':type/today'   => 'events#today',    :constraints => {:type => /[[:print:]]+/}, :as => 'by_type_today'
        get ':type/archive' => 'events#archive',  :constraints => {:type => /[[:print:]]+/}, :as => 'by_type_archive'
        get ':type/archive/:date' => 'events#archive',  :constraints => {:type => /[[:print:]]+/, :date => /\d{4}-\d{2}-\d{2}/}, :as => 'by_type_date_archive'
        get 'archive/:date' => 'events#archive',  :constraints => {:date => /\d{4}-\d{2}-\d{2}/}, :as => 'by_date_archive'
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


  # Frontend routes
  namespace :events do
    resources :times, :only => [:index, :show]
  end

  # Admin routes
  namespace :events, :path => '' do
    namespace :admin, :path => 'refinery/events' do
      resources :times, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
