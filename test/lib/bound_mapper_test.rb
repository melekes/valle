require "test_helper"

class BoundMapperTest < TestCase

  def setup
    @bound_mapper = Valle::BoundMapper.new
  end

  def test_should_return_bound_for_abstract_column
    column = ActiveRecord::ConnectionAdapters::Column.new("test_column", "")
    assert @bound_mapper.bound(column), "Bound for column '#{column.name}' not found"
  end

  def test_should_return_bound_for_column_with_type_string
    column = ActiveRecord::ConnectionAdapters::Column.new("test_column", "", "string(255)")

    bound = @bound_mapper.bound(column)

    assert_equal nil, bound.minimum
    assert_equal 255, bound.maximum
  end

end
