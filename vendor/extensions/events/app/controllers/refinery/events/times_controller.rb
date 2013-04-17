module Refinery
  module Events
    class TimesController < ::ApplicationController

      before_filter :find_all_times
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @time in the line below:
        present(@page)
      end

      def show
        @time = Time.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @time in the line below:
        present(@page)
      end

    protected

      def find_all_times
        @times = Time.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/times").first
      end

    end
  end
end
