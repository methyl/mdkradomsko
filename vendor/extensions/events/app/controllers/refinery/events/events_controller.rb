module Refinery
  module Events
    class EventsController < ::ApplicationController

      before_filter :find_active_events, :except => [:archive, :elapsed]
      before_filter :find_all_events, :only => :archive
      before_filter :find_events_by_type

      def index
        by_date(params[:date]) if params[:date]
      end

      def archive
        @page_title = params[:type].capitalize + " - " + ::I18n.t('refinery.plugins.events.archive')
        @events = @events.archived
        
        by_date(Date.strptime(params[:date])) if params[:date]
        render :index
      end

      def show
        @event = Event.find(params[:id])
      end

      def soon
        @page_title = ::I18n.t 'refinery.plugins.events.soon'
        @events = @events.soon
        render :index
      end

      def today
        @page_title = ::I18n.t 'refinery.plugins.events.today'
        @events = @events.today
        render :index
      end

      def dates
        if params[:archive]
          events = Event.archived
        else
          events = Event.active
        end
        events = events.by_type(params[:type]) if params[:type]
        render :json => events.dates
      end

    protected

      def by_date(date)
        date = @events.dates.closest(date)
        @previous_date = @events.dates.previous(date)
        @next_date     = @events.dates.next(date)
        @events = @events.by_date(date)
      end

      def find_active_events
        @events = Event.active.order('refinery_events.position asc')
      end

      def find_all_events
        @events = Event.order('refinery_events.position asc')
      end

      def find_events_by_type
        if params.has_key? :type
          @events = @events.by_type(params[:type])
          @page_title  = params[:type].humanize
        else
          @page_title = ::I18n.t 'refinery.plugins.events.title'
        end
      end
    end
  end
end
