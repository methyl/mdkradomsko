module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
