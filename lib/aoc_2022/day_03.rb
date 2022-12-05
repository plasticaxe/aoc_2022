# frozen_string_literal: true

module Aoc2022
  #----
  class Day03Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map(&:chars)
    end

    def run
      @input.map { |b| priority_of(b.each_slice(b.size / 2).to_a.inject(:&)[0]) }.sum
    end

    private

    def priority_of(item)
      (@priority_of ||= {})[item] ||= begin
        bytes = item.bytes[0]
        if bytes.between?(97, 122)
          bytes - 96
        elsif bytes.between?(65, 90)
          bytes - 38
        else
          raise Error
        end
      end
    end
  end

  #----
  class Day03Part2 < Day03Part1
    def run
      @input.each_slice(3).map { |g| priority_of(g.to_a.inject(:&)[0]) }.sum
    end
  end

  #-----
  module Day03
    def self.part_one(input_file)
      Aoc2022::Day03Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day03Part2.new(input_file).run
    end
  end
end
