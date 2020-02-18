# parse string commands into valid command objects for the bitmap editor
# require 'pry'
class CommandParser
    
    # def execute(unparsed_command)
    #     # this will parse the command if it's valid
    #     parsers = CommandParser.instance_methods(false)
    #     parsers.select {|parser| !!self.send(parser, unparsed_command)}
    # end

    def parse_create_bitmap_command(command)
        #function for parsing the I command
        # validates with regex and returns an object 
        validator = /(^[I])(\s)(\d{1,3})(\s)(\d{1,3}$)/
        validated = validator.match(command)
        return false unless validated
        to_filter = validated.captures
        parsed = to_filter.filter {|element| element != " "}
        {command: parsed[0], parameters:{ x: parsed[1], y: parsed[2]}}
    end
    
    def parse_no_parameter_command(command)
        #function for parsing the C command
        # validates with regex and returns an object 
        validator = /(^[C]$|^[S]$)/
        validated = validator.match(command)
        return false unless validated
        parsed = validated.captures
        {command: parsed[0]}
    end

    def parse_colour_pixel_command(command)
        #function for parsing the L command
        # validates with regex and returns an object 
        validator = /(^[L])(\s)(\d{1,3})(\s)(\d{1,3})(\s)([A-Z]{1}$)/
        validated = validator.match(command)
        return false unless validated
        to_filter = validated.captures
        parsed = to_filter.filter {|element| element != " "}
        {command: parsed[0], parameters:{ x: parsed[1], y: parsed[2], colour: parsed[3]}}
    end

    def parse_colour_vertical_segment_command(command)
        #function for parsing the L command
        # validates with regex and returns an object 
        validator = /(^[V])(\s)(\d{1,3})(\s)(\d{1,3})(\s)(\d{1,3})(\s)([A-Z]{1}$)/
        validated = validator.match(command)
        return false unless validated
        to_filter = validated.captures
        parsed = to_filter.filter {|element| element != " "}
        {command: parsed[0], parameters:{ x: parsed[1], y1: parsed[2], y2: parsed[3] ,colour: parsed[4]}}
    end
    # def space_filter(arr)
    #     binding.pry
    #     # arr.split(" ")
    #     arr.filter {|element| element != " "}
    # end
end

# CommandParser.new.execute("I 5 6")