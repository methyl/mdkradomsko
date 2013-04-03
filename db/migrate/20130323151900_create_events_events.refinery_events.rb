# This migration comes from refinery_events (originally 1)
class CreateEventsEvents < ActiveRecord::Migration

  def up
    create_table :refinery_events do |t|
      t.string :name
      t.string :info
      t.text :description
      t.datetime :date
      t.string :hours
      t.integer :type_id
      t.integer :position

      t.timestamps
    end

    Refinery::Events::Event.create_translation_table! :name => :string, :info => :string, :description => :text, :hours => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/events"})
    end

    drop_table :refinery_events

    Refinery::Events::Event.drop_translation_table!

  end

end
