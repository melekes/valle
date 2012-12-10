require 'valle/configuration'

module Valle
  extend Configuration

  # core
  autoload :BoundMapper, 'valle/bound_mapper'
  autoload :BoundsManager, 'valle/bounds_manager'
  autoload :ValidationSetter, 'valle/validation_setter'

  # extensions
  module AbstractAdapter
    autoload :ColumnWrapper, 'valle/abstract_adapter/column_wrapper'
  end

  # hooks
  autoload :Hooks, 'valle/hooks'
end

## if not using Railtie, call `Valle::Hooks.init` directly
require 'valle/railtie' if defined? Rails
