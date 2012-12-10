require "test_helper"
require "active_record"

class ColumnWrapperTest < TestCase

  def test_limit_in_bytes_returns_false_for_string_column
    column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", "string")
    wrapped_column = Valle::AbstractAdapter::ColumnWrapper.wrap(column)

    assert !wrapped_column.limit_in_bytes?
  end

  def test_limit_in_bytes_returns_true_for_integer_column
    column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", "int")
    wrapped_column = Valle::AbstractAdapter::ColumnWrapper.wrap(column)

    assert wrapped_column.limit_in_bytes?
  end
end
