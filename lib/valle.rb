require 'valle/configuration'
require 'active_record'

module Valle
  extend Configuration

  autoload :BoundMapper, 'valle/bound_mapper'
  autoload :BoundsManager, 'valle/bounds_manager'
  autoload :ValidationSetter, 'valle/validation_setter'
end
