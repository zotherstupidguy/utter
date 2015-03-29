case @command 
when "new"
  #TODO make a Rakefile in the project folder to setup all the needed functionality and then use it from the bin script
  @model = Utter::Utils::Str.new ARGV[0] 
  @ver     = ARGV[1] 
  p "generating a new utter project" 
  p "#{@model.plural}::#{@ver}" 
end
