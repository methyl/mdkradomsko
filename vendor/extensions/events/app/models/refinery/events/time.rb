module Refinery
  module Events
    class Time < Refinery::Core::BaseModel

      attr_accessible :time, :event_id, :position, :msk_event_id, :msk_event_url

      attr_accessor :msk_event_url
      # def title was created automatically because you didn't specify a string field
      # when you ran the refinery:engine generator. <3 <3 Refinery CMS.

      default_scope order('time ASC')

      belongs_to :event 

      # before_validation :set_msk_event_id

      def title
        "Override def title in vendor/extensions/events/app/models/refinery/events/time.rb"
      end

      def msk_url(return_url="http://mdkradomsko.pl")
        return unless msk_event_id
        "http://79.190.29.26/msi/default.aspx?event_id=#{msk_event_id}&returnlink=#{return_url}"
      end

      # def set_msk_event_id
      #   self.msk_event_id = 10
      #   return unless self.msk_event_url
      #   match = self.msk_event_url.match(/event_id=(\d+)/)
      #   if match and match[1]
      #     self.msk_event_id = match[1]
      #   end
      # end
    end
  end
end
