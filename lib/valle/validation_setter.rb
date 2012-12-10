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
        case column.type
        when :string
          klass.validates column.name, length: { maximum: column.maximum }
        end
      end
    end
  end
end
