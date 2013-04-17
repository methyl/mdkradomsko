# This migration comes from refinery_events (originally 3)
class CreateEventsTimes < ActiveRecord::Migration

  def up
    create_table :refinery_events_times do |t|
      t.datetime :time
      t.integer :event_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/times"})
    end

    drop_table :refinery_events_times

  end

end
