class AddPositionToRefineryNewsItems < ActiveRecord::Migration
  def change
    add_column :refinery_news_items, :position, :integer
  end
end
