module Valle
  module AbstractAdapter
    class AbstractColumn

      ##
      # Adds more functionality to the standard ActiveRecord::ConnectionAdapters::Column
      #
      # @param [ActiveRecord::ConnectionAdapters::Column] original_column the original column
      #
      # @example
      #   c = AbstractAdapter::AbstractColumn.new(original_column)
      #
      #   c.minimum
      #     => -128
      #   c.maximum
      #     => 127
      #
      def initialize(original_column)
        @original_column = original_column
      end

      ##
      # Proxy all methods missing to original column
      #
      def method_missing(method_name, *arguments, &block)
        @original_column.send(method_name, *arguments, &block)
      end

      def respond_to_method_missing?(method_name, include_private = false)
        @original_column.respond_to?(method_name)
      end

      ##
      # Get maximum possible value/length for this column
      #
      def maximum
        raise NotImplementedError.new("You must implement maximum method.")
      end

      ##
      # Get minimum value/length for this column
      #
      def minimum
        raise NotImplementedError.new("You must implement minimum method.")
      end
    end
  end
end
