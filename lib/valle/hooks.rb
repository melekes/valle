module Valle
  class Hooks

    class << self

      ##
      # Runs all the hooks, required for this gem
      #
      def init
        ActiveSupport.on_load(:active_record) do
          Valle::Hooks.extend_inherited_method
        end
      end

      ##
      # Extends the functionality of inherited method
      #
      def extend_inherited_method
        ActiveRecord::Base.class_eval do
          class << self
            def inherited_with_valle_validators(subclass)
              inherited_without_valle_validators(subclass)
              Valle::Hooks.extend_ar_validations_valid_method(subclass)
            end

            alias_method_chain :inherited, :valle_validators
          end
        end
      end

      ##
      # Extends the functionality of ActiveRecord::Validations valid? method
      #
      # @param [ActiveRecord::Base] subclass the AR::Base child class
      # @note ActiveRecord::Validations should be defined at this point
      #
      def extend_ar_validations_valid_method(subclass)
        subclass.instance_eval do
          cattr_accessor :valle_validators
        end

        subclass.class_eval do
          def valid_with_valle_validators?(context = nil)
            self.class.valle_validators ||= Valle::BoundsManager.add_validators(self.class)
            valid_without_valle_validators?(context)
          end

          alias_method_chain :valid?, :valle_validators
        end
      end
    end
  end
end
