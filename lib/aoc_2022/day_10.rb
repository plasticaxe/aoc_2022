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
      [20, 60, 100, 140, 180, 220].map { |c| c * instruction_values[c] }.sum
    end

    private

    def instruction_values
      @instruction_values ||= begin
        register = {}
        register_changes.each_index { |index| register[index] = register_changes.first(index + 1).sum }
        register
      end
    end

    def register_changes
      register_changes = [1]
      @input.each { |i| register_changes += i[:cmd].eql?(:noop) ? [0] : [0, i[:val]] }
      register_changes
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
      [instruction_values[cycle] - 1, instruction_values[cycle], instruction_values[cycle] + 1]
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
