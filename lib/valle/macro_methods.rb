require 'active_support'

module Valle
  module MacroMethods
    extend ActiveSupport::Concern

    module ClassMethods
      def valle(*args)
        Valle::BoundAssigner.add_bounds(self, *args)
      end
    end
  end
end
