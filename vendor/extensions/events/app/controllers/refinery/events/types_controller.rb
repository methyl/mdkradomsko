module Refinery
  module Events
    class TypesController < ::ApplicationController

      before_filter :find_all_types
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @type in the line below:
        present(@page)
      end

      def show
        @type = Type.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @type in the line below:
        present(@page)
      end

    protected

      def find_all_types
        @types = Type.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/types").first
      end

    end
  end
end
