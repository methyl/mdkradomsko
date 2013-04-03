class CreateEventsTypes < ActiveRecord::Migration

  def up
    create_table :refinery_events_types do |t|
      t.string :name
      t.integer :position

      t.timestamps
    end

    Refinery::Events::Type.create_translation_table! :name => :string

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-events"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/events/types"})
    end

    drop_table :refinery_events_types

    Refinery::Events::Type.drop_translation_table!

  end

end
