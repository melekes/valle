module Valle
  class Hooks

    class << self

      def init
        ActiveSupport.on_load(:active_record) do
          ActiveRecord::Base.class_eval do

            class << self

              def inherited_with_valle_validators(subclass)
                Valle::BoundsManager.add_validators(subclass)
                inherited_without_valle_validators(subclass)
              end

              alias_method_chain :inherited, :valle_validators
            end

          end
        end
      end
    end
  end
end
