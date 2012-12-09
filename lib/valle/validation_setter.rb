module Valle
  class ValidationSetter
    class << self

      ##
      # Adds validator to the klass column depending on its type
      #
      # @param [Bound] bound the bound
      # @param [Column] column the column
      # @param [ActiveRecord::Base] klass the AR model class
      #
      def add_validator(bound, column, klass)
        case column.type
        when :string
          klass.validates column.name, length: { maximum: bound.maximum }
        else
          raise "Unknown column type #{column.type}"
        end
      end
    end
  end
end
