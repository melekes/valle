module Valle
  class Railtie < ::Rails::Railtie #:nodoc:
    config.after_initialize do
      Valle::Hooks.init
    end
  end
end
