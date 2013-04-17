class AddImageIdToEvent < ActiveRecord::Migration
  def change
    add_column :refinery_events, :image_id, :integer
  end
end
