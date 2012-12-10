module Valle
  module AbstractAdapter
    class ColumnWrapper

      ##
      # Adds more functionality to the standard Adapter::Column
      #
      # @example
      #   wrapped_column = AbstractAdapter::ColumnWrapper.wrap(column)
      #
      #   wrapped_column.limit_in_bytes?
      #     => false
      #
      def initialize(column)
        @column = column
      end

      ##
      # Proxy all methods missing to original column
      #
      def method_missing(method_name, *arguments, &block)
        @column.send(method_name, *arguments, &block)
      end

      def respond_to_method_missing?(method_name, include_private = false)
        @column.respond_to?(method_name)
      end

      ##
      # Determines whether the limit's method returned value is a count of bytes
      #
      # Limit is number of characters for :string and :text columns
      # and number of bytes for :binary and :integer columns.
      # @see http://apidock.com/rails/ActiveRecord/ConnectionAdapters/TableDefinition/column
      #
      def limit_in_bytes?
        case type
        when :binary; true
        when :integer; true
        else false
        end
      end

      class << self

        ##
        # Wraps original column
        #
        # @param [AbstractAdapter::Column] column the original column
        def wrap(column)
          new(column)
        end
      end

    end
  end
end
