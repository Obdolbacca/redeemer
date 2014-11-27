Dir["#{File.dirname(__FILE__)}/integrations/*.rb"].sort.each do |path|
  require "redeemer/integrations/#{File.basename(path)}"
end
