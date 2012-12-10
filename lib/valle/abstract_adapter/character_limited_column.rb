module Valle
  module AbstractAdapter
    class CharacterLimitedColumn < AbstractColumn

      def maximum
        limit
      end

      def minimum
        nil
      end
    end
  end
end
