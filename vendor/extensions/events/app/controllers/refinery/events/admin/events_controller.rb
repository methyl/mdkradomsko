module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        before_filter :types

        crudify :'refinery/events/event',
                :title_attribute => 'name'

        def index
          @events = Refinery::Events::Event.order('refinery_events.position asc')
          @events = @events.by_type(params[:type]) if params[:type]
        end

        def self.pageable?
          false
        end

        def types
          @types = Refinery::Events::Type.all
        end

      end
    end
  end
end
