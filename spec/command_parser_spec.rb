require 'spec_helper'
require './lib/command_parser.rb'

describe CommandParser do
    before(:all) do
        @command_parser = CommandParser.new
        @command_two = "T 9"
    end
    
    context 'The Class' do
        it 'Should exist' do
            expect(Object.const_defined?('CommandParser')).to eq(true)
        end
        it 'should have parse_create_bitmap_command defined' do
            expect(CommandParser.method_defined? :parse_create_bitmap_command).to eq(true)
        end
        it 'should have parse_no_parameter_command defined' do
            expect(CommandParser.method_defined? :parse_no_parameter_command).to eq(true)
        end
        it 'should have parse_colour_pixel_command defined' do
            expect(CommandParser.method_defined? :parse_colour_pixel_command).to eq(true)
        end
        it 'should have parse_colour_vertical_segment_command defined' do
            expect(CommandParser.method_defined? :parse_colour_vertical_segment_command).to eq(true)
        end
        it 'should have parse_colour_horizontal_segment_command defined' do
            expect(CommandParser.method_defined? :parse_colour_horizontal_segment_command).to eq(true)
        end
    end
    context 'parse_create_bitmap_command' do
        before(:each) do
            @command_one = "I 5 5"
        end
        it 'should parse a correct command and return object' do
            expect(@command_parser.parse_create_bitmap_command(@command_one)).to eq({command: "I", parameters:{ x: "5", y: "5"}})
        end
        it 'should not parse a command if it is incorrect' do
            
            expect(@command_parser.parse_create_bitmap_command(@command_two)).to eq(false)
        end
    end
    context 'parse_no_parameter_command' do
        before(:each) do
            @command_one = "S"
        end
        it 'should parse a correct command and return object' do
            expect(@command_parser.parse_no_parameter_command(@command_one)).to eq({command: "S"})
        end
        it 'should not parse a command if it is incorrect' do
            expect(@command_parser.parse_no_parameter_command(@command_two)).to eq(false)
        end
    end
    context 'parse_colour_pixel_command' do
        before(:each) do
            @command_one = "L 1 3 X"
        end
        it 'should parse a correct command and return object' do
            expect(@command_parser.parse_colour_pixel_command(@command_one)).to eq({command: "L", parameters:{ x: "1", y: "3", colour: "X"}})
        end
        it 'should not parse a command if it is incorrect' do
            expect(@command_parser.parse_colour_pixel_command(@command_two)).to eq(false)
        end
    end
    context 'parse_colour_vertical_segment_command' do
        before(:each) do
            @command_one = "V 1 3 1 X"
        end
        it 'should parse a correct command and return object' do
            expect(@command_parser.parse_colour_vertical_segment_command(@command_one)).to eq({command: "V", parameters:{ x: "1", y1: "3", y2: "1", colour: "X"}})
        end
        it 'should not parse a command if it is incorrect' do
            expect(@command_parser.parse_colour_vertical_segment_command(@command_two)).to eq(false)
        end
    end
    context 'parse_colour_horizontal_segment_command' do
        before(:each) do
            @command_one = "H 1 3 1 X"
        end
        it 'should parse a correct command and return object' do
            expect(@command_parser.parse_colour_horizontal_segment_command(@command_one)).to eq({command: "H", parameters:{ x1: "1", x2: "3", y: "1", colour: "X"}})
        end
        it 'should not parse a command if it is incorrect' do
            expect(@command_parser.parse_colour_horizontal_segment_command(@command_two)).to eq(false)
        end
    end
end
