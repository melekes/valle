require "test_helper"
require "active_record"

class ColumnWrapperTest < TestCase

  def test_wrap_should_return_instance_of_character_limited_column_for_string_column
    column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", "varchar(255)")
    wrapped_column = Valle::AbstractAdapter::ColumnWrapper.wrap(column)

    assert wrapped_column.is_a?(Valle::AbstractAdapter::CharacterLimitedColumn)
  end

  def test_wrap_should_return_instance_of_byte_limited_column_for_int_column
    column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", "int")
    wrapped_column = Valle::AbstractAdapter::ColumnWrapper.wrap(column)

    assert wrapped_column.is_a?(Valle::AbstractAdapter::ByteLimitedColumn)
  end
end
