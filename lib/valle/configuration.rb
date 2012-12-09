# TODO [AK 09/12/12] maybe we should use ActiveSupport::Configurable ?
require 'active_support/core_ext/module/attribute_accessors'

module Valle
  module Configuration

    mattr_accessor :options

    self.options = {
      enabled: true, # gem is enabled by default
      models: nil # nil means to select all the AR models
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
  end
end
