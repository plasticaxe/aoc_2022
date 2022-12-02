# frozen_string_literal: true

module Aoc2022
  #----
  class Day01Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      elf_calories.max
    end

    def elf_calories
      @input.chunk(&:empty?).map { |c| c[1].map(&:to_i).sum unless c[0] }.compact
    end
  end

  #----
  class Day01Part2 < Day01Part1
    def run
      elf_calories.sort.last(3).sum
    end
  end

  #-----
  module Day01
    def self.part_one(input_file)
      Aoc2022::Day01Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day01Part2.new(input_file).run
    end
  end
end
