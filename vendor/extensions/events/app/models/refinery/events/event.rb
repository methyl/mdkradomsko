# encoding: UTF-8

module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :name, :info, :description, :date, :hours, :type_id, :position, :image_id, :promoted, :times_attributes, :archived
      translates :name, :info, :description, :hours

      class Translation
        attr_accessible :locale
      end

      has_many_page_images

      acts_as_indexed :fields => [:name, :info, :description, :hours]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :type
      belongs_to :image

      has_many :times
      accepts_nested_attributes_for :times

      def grouped_times
        times.select{ |t| t.time }.group_by{ |t| t.time.to_date }
      end

      def elapsed?
        type.name == 'Wydarzyło się'
      end

      def self.soon
        next_events.limit(5)
      end

      def self.by_date(date)
        joins_time
          .where('DATE(times.time)=? OR DATE(refinery_events.date)=?', date, date)
          .group('refinery_events.id')
          .order('refinery_events.position asc')
      end

      def self.today
        joins_time.where('DATE(times.time)=?', Date.today).group('refinery_events.id')
      end

      def self.previous
        joins_time.where('DATE(times.time)<?', Date.today).group('refinery_events.id')
      end

      def self.next_events
        joins_time.where('DATE(times.time)>?', Date.today).group('refinery_events.id')
      end

      def self.active
        where('not archived')
      end

      def self.archived
        where('archived')
      end

      def self.elapsed
        joins('JOIN refinery_events_types AS types ON types.id=refinery_events.type_id').where('types.name="Wydarzyło się"')
      end

      def today_hours
        times.where('DATE(time)=?', Date.today).map {|time| time.time.strftime('%H:%M')}
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
        dates = joins_time.select('time').group('DATE(times.time)').order('DATE asc').map(&:time).map(&:to_date)
        ::DateCollection.new dates
      end

      def self.joins_time
        joins('JOIN refinery_events_times AS times ON times.event_id=refinery_events.id')
      end
    end
  end
end
