module Refinery
  module News
    module Admin
      class ItemsController < ::Refinery::AdminController

        crudify :'refinery/news/item', :order => "position DESC, publish_date DESC"

      end
    end
  end
end
