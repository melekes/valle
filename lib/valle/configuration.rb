require 'active_support/core_ext/module/attribute_accessors'

module Valle
  module Configuration

    mattr_accessor :options

    self.options = {
      enabled: true, # gem is enabled by default
      exclude_models: nil, # selects all AR models by default
      exclude_attributes: nil, # adds validators to all attributes by default
    }

    def configure
      yield self
    end

    def enabled=(value)
      self.options[:enabled] = value
    end

    def exclude_models=(collection)
      self.options[:exclude_models] = collection
    end

    def exclude_attributes=(mapping)
      self.options[:exclude_attributes] = mapping
    end
  end
end
