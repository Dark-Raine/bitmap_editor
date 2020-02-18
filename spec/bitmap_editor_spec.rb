require 'spec_helper'
require './config/environment.rb'
require 'json'

describe 'BitmapEditor' do
    before(:all) do
        @file = "test.txt"
        file = File.open("test.txt", "w") do |f|
            f.write("L 10 10 B\nI 5 6\nC\nV 3 3 3 X\nH 6 3 6 Y\nP\nS 0 0\nS")
        end
        @bitmap_editor = BitmapEditor.new
        capture = StringIO.new
        $stdout = capture
    end
    after(:all) do
      File.delete("test.txt")
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
