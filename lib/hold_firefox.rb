require "hold_firefox/version"
require 'pathname'

module HoldFirefox
  # Your code goes here...
end

if RUBY_PLATFORM =~ /linux/i
  Selenium::WebDriver::Firefox::Binary.path = Pathname.new(File.dirname(__FILE__)).join('..', 'ext', 'hold_firefox', 'firefox', 'firefox-bin').to_s
elsif RUBY_PLATFORM =~ /darwin/i
  Selenium::WebDriver::Firefox::Binary.path = Pathname.new(File.dirname(__FILE__)).join('..', 'ext', 'hold_firefox', 'Firefox.app', 'Contents', 'MacOS', 'firefox-bin').to_s
end
