require "hold_firefox/version"
require 'pathname'

module HoldFirefox
  class Path
    def initialize(platform)
      @platform = platform
      return unless allowed?
      Selenium::WebDriver::Firefox::Binary.path = firefox_path
    end

    # Folder path
    def home
      Pathname.new(File.dirname(__FILE__)).join('..', 'ext', 'hold_firefox')
    end

    def firefox_path
      if @platform =~ /linux/i
        home.join('firefox', 'firefox-bin').to_s
      elsif @platform =~ /darwin/i
        home.join('Firefox.app', 'Contents', 'MacOS', 'firefox-bin').to_s
      end
    end

    def allowed?
      @platform =~ /linux/i || @platform =~ /darwin/i
    end
  end
end

HoldFirefox::Path.new(RUBY_PLATFORM)
