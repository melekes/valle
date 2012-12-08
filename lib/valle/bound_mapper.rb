module Valle
  Bound = Struct.new :minimum, :maximum

  class BoundMapper

    def initialize
    end

    def bound(column)
      Bound.new minimum(column), maximum(column)
    end

    private

    def minimum(column)

    end

    def maximum(column)
      column.limit
    end
  end
end
