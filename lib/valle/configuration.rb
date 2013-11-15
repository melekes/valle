require 'active_support/core_ext/module/attribute_accessors'
require 'active_support/hash_with_indifferent_access'

module Valle
  module Configuration

    mattr_accessor :options

    self.options = {
      enabled: true, # gem is enabled by default
      models: nil, # selects all AR models by default
      attributes: ActiveSupport::HashWithIndifferentAccess.new, # adds validators to all attributes by default
    }

    def configure
      yield self
    end

    def enabled=(value)
      self.options[:enabled] = value
    end

    def models=(collection)
      self.options[:models] = collection
    end

    def attributes=(mapping)
      self.options[:attributes] = mapping
    end
  end
end
