require 'valle/configuration'

module Valle
  extend Configuration

  # core
  autoload :Manager, 'valle/manager'
  autoload :ValidationSetter, 'valle/validation_setter'

  # extensions
  module AbstractAdapter
    autoload :ColumnWrapper, 'valle/abstract_adapter/column_wrapper'
    autoload :AbstractColumn, 'valle/abstract_adapter/abstract_column'
    autoload :ByteLimitedColumn, 'valle/abstract_adapter/byte_limited_column'
    autoload :CharacterLimitedColumn, 'valle/abstract_adapter/character_limited_column'
    autoload :UnlimitedColumn, 'valle/abstract_adapter/unlimited_column'
  end

  # hooks
  autoload :Hooks, 'valle/hooks'
end

## if not using Railtie, call `Valle::Hooks.init` directly
require 'valle/railtie' if defined? Rails
