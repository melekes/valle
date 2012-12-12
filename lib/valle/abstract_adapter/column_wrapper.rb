module Valle
  module AbstractAdapter
    class ColumnWrapper

      class << self

        ##
        # Wraps original column
        #
        # @param [ActiveRecord::ConnectionAdapters::Column] original_column the original column
        #
        def wrap(original_column)
          case
          when limit_in_bytes?(original_column)
            ByteLimitedColumn.new(original_column)
          when limit_in_characters?(original_column)
            CharacterLimitedColumn.new(original_column)
          else
            UnlimitedColumn.new(original_column)
          end
        end

        private

        ##
        # Determines whether the limit's method returned value is count of bytes
        #
        # Limit is number of bytes for :binary and :integer columns.
        # @see http://apidock.com/rails/ActiveRecord/ConnectionAdapters/TableDefinition/column
        #
        def limit_in_bytes?(column)
          case column.type
          when :primary_key; true
          # when :binary; true
          when :integer; true
          else false
          end
        end

        ##
        # Determines whether the limit's method returned value is count of characters
        #
        # Limit is number of characters for :string and :text columns
        # @see http://apidock.com/rails/ActiveRecord/ConnectionAdapters/TableDefinition/column
        #
        def limit_in_characters?(column)
          case column.type
          when :string; true
          when :text; true
          else false
          end
        end
      end
    end
  end
end
