module Refinery
  module Events
    module Admin
      class EventsController < ::Refinery::AdminController

        crudify :'refinery/events/event',
                :title_attribute => 'name',
                :per_page => 100000

      end
    end
  end
end
