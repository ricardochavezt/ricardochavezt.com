# frozen_string_literal: true

require 'fileutils'
require 'pathname'
require 'open3'

module Recents
  # Generate change information for all markdown pages
  class Generator < Jekyll::Generator
    def generate(site)
      items = site.collections['notes'].docs
      items.each do |page|
        stdout_str, stderr_str, status = Open3.capture3("git",
          "log",
          "-n",
          "1",
          '--format="%ct"',
          "--",
          page.path)
        if !status.success?
          puts "Error getting last modified date from Git: #{stderr_str}. Using mtime instead."
          timestamp = File.mtime(page.path)
        else
          timestamp = stdout_str.nil? || stdout_str.empty? ? File.mtime(page.path) : stdout_str[/\d+/].to_i
        end
        page.data['last_modified_at_timestamp'] = Time.at(timestamp).strftime('%FT%T%:z')
      end
    end
  end
end
