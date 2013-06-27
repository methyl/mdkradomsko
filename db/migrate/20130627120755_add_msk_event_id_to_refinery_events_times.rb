class AddMskEventIdToRefineryEventsTimes < ActiveRecord::Migration
  def change
    add_column :refinery_events_times, :msk_event_id, :integer
  end
end
