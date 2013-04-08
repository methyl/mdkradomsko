module Refinery
  module Events
    class Event < Refinery::Core::BaseModel
      self.table_name = 'refinery_events'

      attr_accessible :name, :info, :description, :date, :hours, :type_id, :position

      translates :name, :info, :description, :hours

      class Translation
        attr_accessible :locale
      end

      acts_as_indexed :fields => [:name, :info, :description, :hours]

      validates :name, :presence => true, :uniqueness => true

      belongs_to :type

      scope :by_date, lambda { |date| where(:date => date.beginning_of_day..date.end_of_day) }
      # scope :soon,  where(:date => DateTime.now..DateTime.now + 10.days)
      scope :today, by_date(Date.today)
      scope :previous, where('date < ?', DateTime.now)
      scope :next_events, where('date > ?', DateTime.now)
      scope :soon,  next_events.limit(5)

      def type_name
        type.name.downcase
      end

      def self.by_type(type)
        joins('
          JOIN refinery_events_type_translations AS type 
          ON type.refinery_events_type_id=refinery_events.type_id
        ').where('lower(type.name)=?', type)
      end

      def self.dates
        ::DateCollection.new select('DISTINCT DATE(date) as date').order('date ASC').map {|e| e.date.to_date}
      end
    end
  end
end
