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
    # If the user wants to exclude some models,
    # we need to check whether the model is on the list.
    #
    # @param [String] model_name the model name
    # @see Valle::Configuration
    #
    def can_process_model?(model_name)
      options[:exclude_models].nil? ||
        options[:exclude_models].is_a?(Array) && !options[:exclude_models].include?(model_name)
    end

    ##
    # Can we process this attribute
    #
    # If the user wants to skip some attributes, we need to check
    # whether we should add validators to that column or not.
    #
    # @param [String] model_name model name
    # @param [String] attribute attribute name
    # @see Valle::Configuration
    #
    def can_process_column?(model_name, attribute)
      options[:exclude_attributes].nil? ||
        !options[:exclude_attributes].has_key?(model_name) ||
        options[:exclude_attributes][model_name].is_a?(Array) && !options[:exclude_attributes][model_name].include?(attribute)
    end
  end
end

# if not using Railtie, call `Valle::Hooks.init` directly
require 'valle/railtie' if defined? Rails
