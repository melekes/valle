module Valle

  Bound = Struct.new :minimum, :maximum

  class BoundMapper

    ##
    # Returns a new bound for the column
    #
    # @param [Column] column the column
    #
    def bound(column)
      Bound.new minimum(column), maximum(column)
    end

    private

    ##
    # Get the lower limit for a given column
    #
    # @param [Column] column the column
    #
    def minimum(column)

    end

    ##
    # Get the upper limit for a given column
    #
    # @param [Column] column the column
    #
    def maximum(column)
      column.limit
    end
  end
end
