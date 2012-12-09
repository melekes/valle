module Valle
  class Hooks

    class << self

      def init
        ActiveSupport.on_load(:active_record) do
          ActiveRecord::Base.class_eval do
            # TODO [AK 09/12/12] possible we should run it after the class was inherited
            # @see http://stackoverflow.com/q/7093992/820520
            def self.inherited(subclass)
              Valle::BoundsManager.add_validators(subclass)
            end
          end
        end
      end
    end
  end
end
