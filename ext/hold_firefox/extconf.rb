#!/usr/bin/env ruby
require 'mkmf'
create_makefile 'hold_firefox'
exit if RUBY_PLATFORM =~ /mswin/i || RUBY_PLATFORM =~ /win32/i || RUBY_PLATFORM =~ /mingw/

root = File.expand_path('..', __FILE__)
Dir.chdir(File.join(root)) do
  if RUBY_PLATFORM =~ /linux/i
    unless File.exist?('/tmp/firefox-45.0.tar.bz2')
      system "wget https://ftp.mozilla.org/pub/firefox/releases/45.0/linux-x86_64/pt-BR/firefox-45.0.tar.bz2 -O /tmp/firefox-45.0.tar.bz2"
    end
    system "cp /tmp/firefox-45.0.tar.bz2 firefox-45.0.tar.bz2"
    system "tar -jxvf firefox-45.0.tar.bz2"
    system "rm firefox-45.0.tar.bz2"
  elsif RUBY_PLATFORM =~ /darwin/i
    unless File.exist?('/tmp/Firefox_45.0.dmg')
      system "curl -o /tmp/Firefox_45.0.dmg 'https://ftp.mozilla.org/pub/firefox/releases/45.0/mac/pt-BR/Firefox%2045.0.dmg'"
    end
    mount_path = `hdiutil attach -nobrowse -noautoopen /tmp/Firefox_45.0.dmg | grep Firefox`.split(' ').first
    system "cp -R /Volumes/Firefox/Firefox.app . "
    system "hdiutil detach #{mount_path}"
  end
end

