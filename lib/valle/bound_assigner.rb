module Valle
  class BoundAssigner

    class << self

      def add_bounds(owner_class, *args)
        options = {}
        options[:columns] = args.first.is_a?(Array) && args.first || :all

        columns = owner_class.columns
        if options[:columns] != :all
          columns = columns.select { |c| options[:columns].include? c.name.to_sym }
        end

        mapper = BoundMapper.new

        columns.each do |column|
          bound = mapper.bound(column)
          ValidationSetter.inject(bound, column, owner_class)
        end
      end
    end
  end
end
