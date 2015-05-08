require_relative './../helper'

# so organize most basic tasks in a rakefile
# launch a number of task(s) for a single command from a ruby file
# templates
# 	- new api
# 	- new endpoint
# utils 
# 	- color
# 	- plural

describe 'Console' do 
  describe "New Project" do 
    before do  
      @folder = "marvel"
      `ruby ../../bin/utter new #{@folder}`
    end

    it "creates a folder" do 
      #File.directory?(@folder)
    end

    after do 
      #File.directory?(directory)
      # delete the files
    end
  end
end
