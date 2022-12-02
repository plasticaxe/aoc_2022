# frozen_string_literal: true

module Aoc2022
  #----
  class Day22Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      # ---
    end
  end

  #----
  class Day22Part2 < Day22Part1
    def run
      # ---
    end
  end

  #-----
  module Day22
    def self.part_one(input_file)
      Aoc2022::Day22Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day22Part2.new(input_file).run
    end
  end
end
