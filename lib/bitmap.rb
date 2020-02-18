class Bitmap
    # this will execute changes to the bit map from a parsed command
    attr_reader :map


    def restrict_y(num)
        num.to_i.clamp(1,@y_max||250)
    end

    def restrict_x(num)
        num.to_i.clamp(1,@x_max||250)
    end

    def i(x:,y:)
        # the create bitmap command
        @y_max = restrict_y(y)
        @x_max = restrict_x(x)
        @map = Array.new(@y_max) {Array.new(@x_max, 0)}
    end

    def c
        @map.each {|row| row.fill("O")}
    end
    
    def l(x:,y:,colour:)
        @map[restrict_y(y)-1][restrict_x(x)-1] = colour
    end
end