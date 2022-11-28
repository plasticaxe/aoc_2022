# frozen_string_literal: true

module Aoc2022
  #----
  class Day09Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #----
  class Day09Part2 < Day09Part1
    def run
      # ---
    end
  end

  #-----
  module Day09
    def self.default_input_file
      File.join(Aoc2022::INPUT_FILES, 'day_09_example.txt')
      # File.join(Aoc2022::INPUT_FILES, 'day_09.txt')
    end

    def self.part_one(input_file = default_input_file)
      Aoc2022::Day09Part1.new(input_file).run
    end

    def self.part_two(input_file = default_input_file)
      Aoc2022::Day09Part2.new(input_file).run
    end
  end
end
