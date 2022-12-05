# frozen_string_literal: true

module Aoc2022
  #----
  class Day05Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      instructions.each { |i| i[:quantity].times { crate_map[i[:destination]].push(crate_map[i[:source]].pop) } }
      top_crates
    end

    private

    def crate_map
      @crate_map ||= begin
        hash = {}
        padded_crate_lines.transpose.map(&:reverse).reject { |a| a[0].eql?(' ') }.each do |c|
          hash[c[0]] = c[1..].reject { |e| e.eql?(' ') }
        end
        hash
      end
    end

    def padded_crate_lines
      crate_lines = @input.reject { |l| l[0].eql?('m') || l.empty? }
      line_length = crate_lines.map(&:size).max
      crate_lines.map { |c| c.chars + Array.new(line_length - c.size, ' ') }
    end

    def instructions
      @input.select { |l| l[0].eql?('m') }.map do |i|
        split_string = i.split
        { quantity: split_string[1].to_i, source: split_string[3], destination: split_string[5] }
      end
    end

    def top_crates
      crate_map.values.map(&:last).join
    end
  end

  #----
  class Day05Part2 < Day05Part1
    def run
      instructions.each { |i| crate_map[i[:destination]].concat(crate_map[i[:source]].pop(i[:quantity])) }
      top_crates
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
