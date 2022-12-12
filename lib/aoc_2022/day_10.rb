# frozen_string_literal: true

module Aoc2022
  #----
  class Day10Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map do |line|
        cmd, val = line.split
        { cmd: cmd.to_sym, val: val.to_i }
      end
    end

    def run
      [20, 60, 100, 140, 180, 220].map { |c| c * register[c] }.sum
    end

    private

    def register
      @register ||= begin
        hash = {}
        instruction_values.each_index { |index| hash[index] = instruction_values.first(index + 1).sum }
        hash
      end
    end

    def instruction_values
      @instruction_values ||= begin
        array = [1]
        @input.each { |i| array += i[:cmd].eql?(:noop) ? [0] : [0, i[:val]] }
        array
      end
    end
  end

  #----
  class Day10Part2 < Day10Part1
    def run
      pixels = 0.upto(240).map { |c| sprite_position(c).include?(c % 40) ? '#' : ' ' }
      # Print soltution
      puts ''
      pixels.each_slice(40) { |s| puts s.join }
      # Create something to verify in rspec tests
      pixels.join.bytes.sum
    end

    private

    def sprite_position(cycle)
      [register[cycle] - 1, register[cycle], register[cycle] + 1]
    end
  end

  #-----
  module Day10
    def self.part_one(input_file)
      Aoc2022::Day10Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day10Part2.new(input_file).run
    end
  end
end
