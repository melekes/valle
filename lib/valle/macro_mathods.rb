module Valle
  module MacroMethods

    def valle(*args)
      Valle::BoundAssigner.add_bounds(self, *args)
    end
  end
end
