class Bitmap
    # this will execute changes to the bit map from a parsed command
    attr_reader :map


    def restrict(num)
        num.to_i.clamp(1,250)
    end

    def i(x:,y:)
        # the create bitmap command
        @map = Array.new(restrict(y)) {Array.new(restrict(x), 0)}
    end
    
    
end