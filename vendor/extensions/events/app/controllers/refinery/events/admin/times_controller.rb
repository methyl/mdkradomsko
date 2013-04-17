module Refinery
  module Events
    module Admin
      class TimesController < ::Refinery::AdminController

        crudify :'refinery/events/time', :xhr_paging => true

      end
    end
  end
end
