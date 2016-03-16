module Valle
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer do
      Valle::Hooks.init
    end
  end
end
