module Refinery
  module Events
    class Time < Refinery::Core::BaseModel

      attr_accessible :time, :event_id, :position
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.

      belongs_to :event 
      def title
        "Override def title in vendor/extensions/events/app/models/refinery/events/time.rb"
      end

      
    end
  end
end
