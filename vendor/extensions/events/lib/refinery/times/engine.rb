module Refinery
  module Events
    class Engine < Rails::Engine
      include Refinery::Engine
      isolate_namespace Refinery::Events

      engine_name :refinery_events

      initializer "register refinerycms_times plugin" do
        Refinery::Plugin.register do |plugin|
          plugin.name = "times"
          plugin.url = proc { Refinery::Core::Engine.routes.url_helpers.events_admin_times_path }
          plugin.pathname = root
          plugin.activity = {
            :class_name => :'refinery/events/time'
          }
          plugin.menu_match = %r{refinery/events/times(/.*)?$}
          plugin.hide_from_menu = true 
        end
      end

      config.after_initialize do
        Refinery.register_extension(Refinery::Times)
      end
    end
  end
end
