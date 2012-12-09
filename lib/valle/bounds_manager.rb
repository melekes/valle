module Valle
  class BoundsManager

    class << self

      ##
      # Adds bounds to a given class
      #
      # 2 steps:
      #   1) get bound for the column
      #   2) set validation
      #
      # @param [ActiveRecord::Base] klass the AR model class
      #
      def add_bounds(klass)
        mapper = BoundMapper.new

        columns = klass.columns
        columns.each do |column|
          bound = mapper.bound(column)
          ValidationSetter.add_validator(bound, column, klass)
        end
      end
    end
  end
end
