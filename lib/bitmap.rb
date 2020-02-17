require 'pry'
class Bitmap
    # this will execute changes to the bit map from a parsed command
    attr_reader :map


    def restrict(num)
        num.clamp(1,250)
    end

    def create_map(x,y)
        @map = Array.new(restrict(y)) {Array.new(restrict(x), 0)}
    end
    
    
end

binding.pry