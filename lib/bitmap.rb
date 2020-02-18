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

    def s
        pp @map
    end
    
    def l(x:,y:,colour:)
        @map[restrict_y(y)-1][restrict_x(x)-1] = colour
    end

    def v(x:,y1:,y2:,colour:)
        corrected_y1 = restrict_y(y1)
        corrected_y2 = restrict_y(y2)
        corrected_x = restrict_x(x)-1
        column_indicies = !(corrected_y1 > corrected_y2) ? (corrected_y1..corrected_y2).to_a : (corrected_y2..corrected_y1).to_a
        column_indicies.each {|indicie| @map[indicie-1][corrected_x]=colour}
    end
end