require 'spec_helper'
require './config/environment.rb'
require 'json'

describe 'BitmapEditor' do
    before(:all) do
        @file = "examples/show.txt"
        @bitmap_editor = BitmapEditor.new
        capture = StringIO.new
        $stdout = capture
    end

    context 'Application' do
        it 'Should take in commands from text file and produce the correct bitmap' do
            @bitmap_editor.run(@file)
            parsed = JSON.parse($stdout.string.chomp)
            expect(parsed).to eq([["O", "O", "O", "O", "O"], 
                                ["O", "O", "O", "O", "O"], 
                                ["O", "O", "X", "O", "O"], 
                                ["O", "O", "O", "O", "O"], 
                                ["O", "O", "O", "O", "O"], 
                                ["O", "O", "Y", "Y", "Y"]])
        end
        
    end
    
    
end
