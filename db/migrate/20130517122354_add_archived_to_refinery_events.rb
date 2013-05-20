class AddArchivedToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :archived, :boolean, :default => false, :null => false
  end
end
