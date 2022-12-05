# frozen_string_literal: true

module Aoc2022
  #----
  class Day04Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
      @input.map! { |l| l.split(',').map { |z| z.split('-')[0].to_i.upto(z.split('-')[1].to_i).to_a } }
    end

    def run
      @input.count { |a| (a[0] - a[1]).empty? || (a[1] - a[0]).empty? }
    end
  end

  #----
  class Day04Part2 < Day04Part1
    def run
      @input.count { |a| (a[0] & a[1]).any? }
    end
  end

  #-----
  module Day04
    def self.part_one(input_file)
      Aoc2022::Day04Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day04Part2.new(input_file).run
    end
  end
end
