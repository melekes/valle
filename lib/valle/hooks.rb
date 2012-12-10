module Valle
  class Hooks

    class << self

      def init
        ActiveSupport.on_load(:active_record) do
          ActiveRecord::Base.class_eval do

            def self.inherited_with_valle_validators(subclass)
              Valle::BoundsManager.add_validators(subclass)
              inherited_without_valle_validators(subclass)
            end

            class << self
              alias_method_chain :inherited, :valle_validators
            end

          end
        end
      end
    end
  end
end
