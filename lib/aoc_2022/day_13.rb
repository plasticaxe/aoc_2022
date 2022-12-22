# frozen_string_literal: true

module Aoc2022
  #----
  class Day13Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      packet_pairs.map do |p|
        v1 = *p[:pair_one]
        v2 = *p[:pair_two]
        right_order_pair?(v1, v2) ? p[:index] : nil
      end.compact.sum
    end

    private

    def right_order_pair?(pair_one, pair_two)
      pair_one.zip(pair_two).each do |zipped_pair|
        value_one, value_two = zipped_pair
        return false if value_two.nil?

        next if value_one.eql?(value_two)

        return value_one < value_two if both_integers?(value_one, value_two)

        return re_checked_pair(value_one, value_two)
      end
    end

    def both_integers?(value_one, value_two)
      value_one.is_a?(Integer) && value_two.is_a?(Integer)
    end

    def one_is_an_array?(value_one, value_two)
      value_one.is_a?(Array) || value_two.is_a?(Array)
    end

    def re_checked_pair(value_one, value_two)
      array_one = *value_one
      array_two = *value_two
      right_order_pair?(array_one, array_two)
    end

    def packet_pairs
      @packet_pairs ||= @input.each_slice(3).with_index.map do |s, i|
        { index: i + 1, pair_one: JSON.parse(s[0]), pair_two: JSON.parse(s[1]) }
      end
    end
  end

  #----
  class Day13Part2 < Day13Part1
    def run
      bubble_sort(all_signals)
      (all_signals.index([[2]]) + 1) * (all_signals.index([[6]]) + 1)
    end

    private

    def bubble_sort(array)
      (0...array.length - 1).each do |i|
        swapped = false
        (0...array.length - i - 1).each do |j|
          next unless right_order_pair?(array[j + 1], array[j])

          bubble_sort_swap(array, j)
          swapped = true
        end
        break unless swapped
      end
      array
    end

    def bubble_sort_swap(array, index)
      temp             = array[index]
      array[index]     = array[index + 1]
      array[index + 1] = temp
    end

    def all_signals
      @all_signals ||= @input.reject(&:empty?).push('[[2]]').push('[[6]]').map { |s| JSON.parse(s) }.sort_by(&:length)
    end
  end

  #-----
  module Day13
    def self.part_one(input_file)
      Aoc2022::Day13Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day13Part2.new(input_file).run
    end
  end
end
