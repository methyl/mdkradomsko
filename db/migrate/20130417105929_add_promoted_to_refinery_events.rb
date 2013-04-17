class AddPromotedToRefineryEvents < ActiveRecord::Migration
  def change
    add_column :refinery_events, :promoted, :boolean
  end
end
