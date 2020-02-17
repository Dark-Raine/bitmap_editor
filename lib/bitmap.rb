
class Bitmap

    attr_reader :map
    def initialize(x, y)
        @map = Array.new(y) {Array.new(x, 0)} 
    end

    
    
end