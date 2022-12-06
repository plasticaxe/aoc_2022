# frozen_string_literal: true

module Aoc2022
  #----
  class Day06Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a[0].chars
    end

    def run
      required_marker(4)
    end

    private

    def required_marker(length)
      @input.each_index { |i| return i + length if unique_chars?(@input[i..i + (length - 1)], length) }
    end

    def unique_chars?(arr, num)
      (@unique_chars ||= {})[[arr, num]] ||= arr.uniq.size.eql?(num)
    end
  end

  #----
  class Day06Part2 < Day06Part1
    def run
      required_marker(14)
    end
  end

  #-----
  module Day06
    def self.part_one(input_file)
      Aoc2022::Day06Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day06Part2.new(input_file).run
    end
  end
end
