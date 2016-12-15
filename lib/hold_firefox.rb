require "hold_firefox/version"
require 'pathname'

module HoldFirefox
  # Your code goes here...
end

if RUBY_PLATFORM =~ /linux/i
  Selenium::WebDriver::Firefox::Binary.path = Selenium::WebDriver::Firefox::Binary.path = Pathname.new(File.dirname(__FILE__)).join('..', 'ext', 'hold_firefox', 'firefox', 'firefox-bin').to_s
end
