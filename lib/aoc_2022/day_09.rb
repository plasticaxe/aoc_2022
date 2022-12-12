# frozen_string_literal: true

require 'set'

module Aoc2022
  #----
  class Day09Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map do |line|
        dir, amt = line.split
        %i[dir amt].zip([dir, amt.to_i]).to_h
      end
      @tail  = Knot.new
      @head  = Knot.new(tail: @tail)
    end

    def run
      head_movements.each { |movement| @head.move(movement) }
      @tail.history.size
    end

    private

    def head_movements
      @input.flat_map { |movement| send("all_movements_#{movement[:dir].downcase}", movement[:amt]) }
    end

    def all_movements_r(amount)
      amount.times.map { [1, 0] }
    end

    def all_movements_l(amount)
      amount.times.map { [-1, 0] }
    end

    def all_movements_u(amount)
      amount.times.map { [0, 1] }
    end

    def all_movements_d(amount)
      amount.times.map { [0, -1] }
    end

    # ---
    class Knot
      attr_accessor :location, :history

      def initialize(tail: nil)
        @location = [0, 0]
        @history  = (Set.new << @location)
        @tail     = tail
      end

      def move(movement)
        @location = [@location, movement].transpose.map { |l| l.reduce(:+) }
        @history << @location
        return if @tail.nil?

        @tail.move(tail_movement) if tail_should_move?
      end

      private

      def tail_offset
        [@location, @tail.location].transpose.map { |l| l.reduce(:-) }
      end

      def tail_movement
        tail_offset.map { |o| o.abs > 1 ? o / 2 : o }
      end

      def tail_should_move?
        tail_offset.map { |o| o.abs > 1 }.inject(&:|)
      end
    end
  end

  #----
  class Day09Part2 < Day09Part1
    def run
      head_movements.each { |movement| knots.first.move(movement) }
      knots.last.history.size
    end

    private

    def knots
      @knots ||= begin
        array = []
        tail  = nil
        10.times.map { array.unshift(tail = Knot.new(tail: tail)) }
        array
      end
    end
  end

  #-----
  module Day09
    def self.part_one(input_file)
      Aoc2022::Day09Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day09Part2.new(input_file).run
    end
  end
end
