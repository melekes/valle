module Valle
  class ValidationSetter
    class << self

      def inject(bound, column, klass)
        case column.type
        when :string
          # add validator
        else
          raise "Unknown column type #{column.type}"
        end
      end
    end
  end
end
