# frozen_string_literal: true

require 'tree' # https://rubygems.org/gems/rubytree
require 'thor'
require 'yaml'

Dir.glob(File.join(File.dirname(__FILE__), 'aoc_2022', '*.rb')).each do |f|
  require "aoc_2022/#{File.basename(f, '.rb')}"
end

module Aoc2022
  INPUT_FILES = File.join(__dir__, '..', 'resources', 'input')

  class Error < StandardError; end
end
