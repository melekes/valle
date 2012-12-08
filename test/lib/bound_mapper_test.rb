require "test_helper"

class BoundMapperTest < TestCase

  def setup
    @column = ActiveRecord::ConnectionAdapters::Column.new("test_column", "")
    @bound_mapper = Valle::BoundMapper.new
  end
  
  def test_sould_return_bounds_for_column
    assert @bound_mapper.bound_for(@column), "Bound for column '#{@column.name}' not found"
  end

end
