module Valle
  class Manager

    class << self

      # Add validators for all columns of a given model
      #
      # @param [ApplicationRecord] model
      def add_validators(model)
        columns = model.columns
        columns.each do |original_column|
          next unless Valle.can_process_column?(model.model_name.to_s, original_column.name)

          column = AbstractAdapter::ColumnWrapper.wrap(original_column)
          ValidationSetter.add_validator(column, model)
        end
      end

    end
  end
end
