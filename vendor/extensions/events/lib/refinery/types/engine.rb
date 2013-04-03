module Refinery
  module Events
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Events

      engine_name :refinery_events

      initializer "register refinerycms_types plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "types"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.events_admin_types_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/events/type',
            :title => 'name'
          }
          plugin.menu_match = %r{refinery/events/types(/.*)?$}
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Types)
      end
    end
  end
end
