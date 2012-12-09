module Valle
  module Configuration

    mattr_accessor :options

    self.options = {
      enabled: true # gem is enabled by default
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
