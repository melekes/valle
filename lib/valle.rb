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

# load Rails/Railtie
begin
  require 'rails'
rescue LoadError
  #do nothing
end

# if not using Railtie, call `Valle::Hooks.init` directly
# TODO [AK 09/12/12] move this block to initializers
if defined? Rails
  require 'valle/railtie'
  require 'valle/engine'
end
