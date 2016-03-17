require "test_helper"

class CharacterLimitedColumnTest < TestCase

  def test_maximum_should_return_value_for_string_column
    original_column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", ::ActiveRecord::Type::String.new(limit: 255))
    column = Valle::AbstractAdapter::CharacterLimitedColumn.new(original_column)

    assert column.maximum
  end

  def test_maximum_should_return_correct_value_for_string_column_if_user_redefine_limit
    original_column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", ::ActiveRecord::Type::String.new(limit: 200))
    column = Valle::AbstractAdapter::CharacterLimitedColumn.new(original_column)

    assert_equal 200, column.maximum
  end

  def test_minimum_should_return_nil
    original_column = ::ActiveRecord::ConnectionAdapters::Column.new("test_column", "", ::ActiveRecord::Type::String.new)
    column = Valle::AbstractAdapter::CharacterLimitedColumn.new(original_column)

    assert_nil column.minimum
  end
end
