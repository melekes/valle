module Valle
  class ValidationSetter
    class << self

      # Adds validator to the model column depending on its type
      #
      # @param [AbstractAdapter::AbstractColumn] column the column
      # @param [ApplicationRecord] model
      #
      def add_validator(column, model)
        options = {}
        options[:minimum] = column.minimum if column.minimum
        options[:maximum] = column.maximum if column.maximum
        return false unless options.present?

        case column.type
        when :string, :text
          model.validates column.name, length: options
        when :integer
          model.validates column.name, numericality: options
        end
      end
    end
  end
end
