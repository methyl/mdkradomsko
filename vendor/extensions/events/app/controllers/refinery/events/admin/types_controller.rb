module Refinery
  module Events
    module Admin
      class TypesController < ::Refinery::AdminController

        crudify :'refinery/events/type',
                :title_attribute => 'name', :xhr_paging => true

      end
    end
  end
end
