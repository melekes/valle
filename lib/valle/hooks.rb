module Valle

  ##
  # Extends the ActiveRecord's inherited method
  #
  module ActiveRecordExt
    def inherited(subclass)
      super
      if Valle::Hooks.can_add_validators?(subclass, self)
        Valle::Hooks.add_validators(subclass)
      end
    end
  end

  class Hooks

    class << self

      ##
      # Runs all the hooks, required for this gem
      #
      def init
        ActiveSupport.on_load(:active_record) do
          Valle::Hooks.run if Valle.enabled?
        end
      end

      ##
      # Runs all the hooks, required for this gem
      #
      def run
        ActiveRecord::Base.singleton_class.include(Valle::ActiveRecordExt)
      end

      ##
      # Adds validators to subclass
      #
      # @param [ActiveRecord::Base] subclass the AR::Base child class
      # @note ActiveRecord::Validations should be defined at this point
      #
      def add_validators(subclass)
        Valle::Manager.add_validators(subclass)
      end

      ##
      # Check whenether we should add validators to subclass
      #
      # @param [ActiveRecord::Base] subclass the AR::Base child class
      # @param [ActiveRecord::Base] inherited_from_class the AR::Base parent class
      # @note ActiveRecord::Validations should be defined at this point
      #
      def can_add_validators?(subclass, inherited_from_class)
        # skip AR::SchemaMigration (AR >= 4.X)
        return false if (defined?(ActiveRecord::SchemaMigration) && subclass == ActiveRecord::SchemaMigration)

        begin
          model_name = subclass.model_name

          Valle.can_process_model?(model_name) &&
            inherited_from_class == ActiveRecord::Base &&
            subclass.table_exists?
        rescue ArgumentError
          false
        end
      end
    end
  end
end
