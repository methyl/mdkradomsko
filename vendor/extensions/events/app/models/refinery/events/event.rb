module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :name, :info, :description, :date, :hours, :type_id, :position, :image_id, :promoted, :times_attributes
      translates :name, :info, :description, :hours

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :info, :description, :hours]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :type
      belongs_to :image

      has_many :times
      accepts_nested_attributes_for :times

      def self.soon
        next_events.limit(5)
      end

      def self.by_date(date)
        joins('JOIN refinery_events_times AS times ON times.event_id=refinery_events.id')
        .where('DATE(times.time)=? OR DATE(refinery_events.date)=?', date, date)
        .group('refinery_events.id')
      end

      def self.today
        joins('JOIN refinery_events_times AS times ON times.event_id=refinery_events.id')
        .where('DATE(times.time)=?', Date.today)
      end

      def self.previous
        joins('JOIN refinery_events_times AS times ON times.event_id=refinery_events.id')
        .where('DATE(times.time)<?', Date.today)
      end

      def self.next_events
        joins('JOIN refinery_events_times AS times ON times.event_id=refinery_events.id')
        .where('DATE(times.time)>?', Date.today)
      end

      def today_hours
        times.where('DATE(time)=?', Date.today).map {|time| time.time.strftime('%H:%m')}
      end

      def type_name
        type.name.downcase
      end

      def self.by_type(type)
        joins('
          JOIN refinery_events_type_translations AS type 
          ON type.refinery_events_type_id=refinery_events.type_id
        ').where('lower(type.name)=?', type)
      end

      def self.promoted
        find_by_promoted(true)
      end

      def self.dates
        ::DateCollection.new Refinery::Events::Time.select('DISTINCT DATE(time) as date').order('date ASC').map {|e| e.date.to_date}
      end
    end
  end
end
