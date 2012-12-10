module Valle
  module AbstractAdapter
    class ByteLimitedColumn < AbstractColumn

      def maximum
        case limit
        when 1; 127
        when 2; 32767
        when 3; 8388607
        when 4; 2147483647
        when 8; 9223372036854775807
        end
      end

      def minimum
        case limit
        when 1; -128
        when 2; -32768
        when 3; -8388608
        when 4; -2147483648
        when 8; -9223372036854775808
        end
      end
    end
  end
end
