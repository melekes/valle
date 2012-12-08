module Valle
  class ValidationSetter
    class << self

      def inject(bound, column, klass)
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
