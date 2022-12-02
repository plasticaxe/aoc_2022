# frozen_string_literal: true

module Aoc2022
  #----
  class Day05Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #----
  class Day05Part2 < Day05Part1
    def run
      # ---
    end
  end

  #-----
  module Day05
    def self.part_one(input_file)
      Aoc2022::Day05Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day05Part2.new(input_file).run
    end
  end
end
