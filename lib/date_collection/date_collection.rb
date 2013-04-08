class DateCollection < Array
  def initialize(dates)
    super(dates.sort)
  end

  def previous(date)
    index = index(closest date) - 1
    fetch(index, nil) unless index < 0
  end

  def next(date)
    index = index(closest date) + 1
    fetch(index, nil) unless index < 0
  end

  def closest(date)
    date = date.to_time.to_i
    # min { |a, b| (a.to_time.to_i - date).abs <=> (b.to_time.to_i - date) }
    sort_by { |item| (date-item.to_time.to_i).abs }.first
  end
end