module Valle
  class BoundAssigner

    class << self

      def add_bounds(owner_class, *args)
        columns = owner_class.columns

        mapper = BoundMapper.new

        columns.each do |column|
          bound = mapper.bound(column)
          ValidationSetter.inject(bound, column, owner_class)
        end
      end
    end
  end
end
