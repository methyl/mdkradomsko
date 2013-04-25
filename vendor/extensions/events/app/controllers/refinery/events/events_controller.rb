module Refinery
  module Events
    class EventsController < ::ApplicationController

      before_filter :find_all_events

      def index
        if params.has_key? :type
          @events = Event.by_type(params[:type])
          @page_title  = params[:type].humanize
        else
          @page_title = ::I18n.t 'refinery.plugins.events.archive'
        end

        date = params[:date] ? Date.strptime(params[:date]) : Date.today
        date = @events.dates.closest(date)
        @previous_date = @events.dates.previous(date)
        @next_date     = @events.dates.next(date)

        @events = @events.by_date(date)
      end

      def show
        @event = Event.find(params[:id])
      end

      def soon
        @page_title = ::I18n.t 'refinery.plugins.events.soon'
        @events = Event.soon
        render :index
      end

      def today
        @page_title = ::I18n.t 'refinery.plugins.events.today'
        @events = Event.today
        render :index
      end

      def dates
        render :json => Event.dates
      end

    protected

      def find_all_events
        @events = Event.order('date ASC')
      end
    end
  end
end
