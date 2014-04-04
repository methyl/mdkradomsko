# encoding: utf-8

Refinery::PagesController.class_eval do
  def home
    @ads = Ad.all
    @news = Refinery::News::Item.latest(6)
    @latest_news = @news.slice!(0)
    @side_events = Refinery::Events::Event.today
    @elapsed_events = Refinery::Events::Event.active.elapsed.order('position').limit(5)
    @promoted = Refinery::Events::Event.promoted
  end
end
