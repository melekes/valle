module Valle
  class Manager

    class << self

      ##
      # Add validators for all columns of a given class
      #
      # @param [ActiveRecord::Base] klass the AR model class
      #
      def add_validators(klass)
        columns = klass.columns
        columns.each do |original_column|
          next unless Valle.can_process_column?(klass.model_name.to_s, original_column.name)

          column = AbstractAdapter::ColumnWrapper.wrap(original_column)
          ValidationSetter.add_validator(column, klass)
        end
      end

    end
  end
end
