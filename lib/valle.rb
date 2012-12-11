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

  class << self

    ##
    # Is gem enabled (true by default)
    #
    # @see Valle::Configuration
    #
    def enabled?
      options[:enabled]
    end

    ##
    # Can we process this model
    #
    # If the user turned gem on only for certain models,
    # we need to check whether the model is in the list.
    #
    # @param [String] model_name the model name
    # @see Valle::Configuration
    #
    def can_process_model?(model_name)
      options[:models].nil? ||
        options[:models].is_a?(Array) && options[:models].include?(model_name)
    end
  end
end

## if not using Railtie, call `Valle::Hooks.init` directly
require 'valle/railtie' if defined? Rails
