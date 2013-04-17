Refinery::PagesController.class_eval do
  def home
    @news = Refinery::News::Item.latest(6)
    @latest_news = @news.slice!(0)
    @side_events = Refinery::Events::Event.today
    @previous_events = Refinery::Events::Event.previous.limit(4)
    @promoted = Refinery::Events::Event.promoted
  end
end