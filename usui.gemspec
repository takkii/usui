# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'usui/version'

Gem::Specification.new do |spec|
  spec.name          = "usui"
  spec.version       = Usui::VERSION
  spec.authors       = ["takkii"]
  spec.email         = ["karuma.reason@gmail.com"]

  spec.summary       = "Usui will work with Java in the jar file."
  spec.description   = "Usui can be compressed and decompressed 18 file."
  spec.homepage      = "https://github.com/takkii/usui"
  spec.license       = "MIT"
  # spec.files         = ["usui.jar"]
end
