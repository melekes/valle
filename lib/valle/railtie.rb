module Valle
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer "valle.after_initialize" do
      Valle::Hooks.init
    end
  end
end
