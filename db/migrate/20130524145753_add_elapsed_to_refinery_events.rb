class AddElapsedToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :elapsed, :boolean
  end
end
