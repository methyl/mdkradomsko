class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :promoted

  def promoted
    @promoted = Refinery::Events::Event.promoted
  end
end
