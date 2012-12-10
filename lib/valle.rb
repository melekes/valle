require 'valle/configuration'

module Valle
  extend Configuration

  # core
  autoload :BoundMapper, 'valle/bound_mapper'
  autoload :BoundsManager, 'valle/bounds_manager'
  autoload :ValidationSetter, 'valle/validation_setter'

  # hooks
  autoload :Hooks, 'valle/hooks'
end

## if not using Railtie, call `Valle::Hooks.init` directly
require 'valle/railtie' if defined? Rails
