$LOAD_PATH.unshift(File.expand_path(File.dirname(__FILE__) + "/../"))

Dir.glob(File.expand_path('vendor/bundle/jruby/*/gems/*/lib')).each do |path|
  $LOAD_PATH << path if !$LOAD_PATH.include?(path)
end

require 'app/main.rb'