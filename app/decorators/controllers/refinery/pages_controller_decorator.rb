Refinery::PagesController.class_eval do
  def home
    @news = Refinery::News::Item.latest(6)
    @latest_news = @news.slice!(0)
    @side_events = Refinery::Events::Event.today
    # render :layout => 'home'
  end
end