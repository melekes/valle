module Valle
  class Hooks

    class << self

      ##
      # Runs all the hooks, required for this gem
      #
      def init
        ActiveSupport.on_load(:active_record) do
          Valle::Hooks.extend_inherited_method if Valle.enabled?
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
              if (Valle.can_process_model?(subclass.model_name) &&
                self == ActiveRecord::Base &&
                (defined?(ActiveRecord::SchemaMigration) && subclass != ActiveRecord::SchemaMigration)) # skip AR::SchemaMigration (AR >= 4.X)
                Valle::Hooks.extend_ar_validations_valid_method(subclass)
              end
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
        Valle::Manager.add_validators(subclass)
      end
    end
  end
end
