
class Bitmap

    attr_reader :map
    def initialize(x, y)
        @map = Array.new(restrict(y)) {Array.new(restrict(x), 0)} 
    end

    def restrict(num)
        num.clamp(1,250)
    end
    
    
end