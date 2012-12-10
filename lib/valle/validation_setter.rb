module Valle
  class ValidationSetter
    class << self

      ##
      # Adds validator to the klass column depending on its type
      #
      # @param [AbstractAdapter::AbstractColumn] column the column
      # @param [ActiveRecord::Base] klass the AR model class
      #
      def add_validator(column, klass)
        options = {}
        options[:minimum] = column.minimum if column.minimum
        options[:maximum] = column.maximum if column.maximum
        return false unless options.present?

        case column.type
        when :string, :text
          klass.validates column.name, length: options
        when :integer
          klass.validates column.name, numericality: options
        end
      end
    end
  end
end
