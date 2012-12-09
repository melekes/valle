module Valle
  class Railtie < ::Rails::Railtie #:nodoc:
    initializer 'valle.init' do
      Valle::Hooks.init
    end
  end
end
