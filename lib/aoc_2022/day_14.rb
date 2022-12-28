# frozen_string_literal: true

module Aoc2022
  #----
  class Day14Part1
    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map { |l| l.split(' -> ') }
    end

    def run
      counter = 0
      loop do
        sand = SandUnit.new(max_y_position)
        break if sand.fall_into_position(grid).eql?(1)

        counter += 1
      end
      counter
    end

    private

    def grid
      @grid ||= begin
        this_grid = Set.new
        @input.each do |i|
          i.each_cons(2).each do |p|
            x1, y1, x2, y2 = path_coordinates(p)
            values_between(x1, x2).each { |x| values_between(y1, y2).each { |y| this_grid << { x: x, y: y } } }
          end
        end
        this_grid
      end
    end

    def path_coordinates(path)
      path.flat_map { |v| v.split(',') }.map(&:to_i)
    end

    def values_between(value_one, value_two)
      value_one < value_two ? value_one.upto(value_two).to_a : value_two.upto(value_one).to_a
    end

    def max_y_position
      @max_y_position ||= grid.map { |p| p[:y] }.max
    end

    #----
    class SandUnit
      attr_accessor :x_position, :y_position

      def initialize(max_y_position)
        @x_position     = 500
        @y_position     = 0
        @max_y_position = max_y_position.freeze
      end

      def fall_into_position(grid)
        loop do
          unless free_to_fall?(grid)
            return 2 if grid.include?({ x: @x_position, y: @y_position })

            grid << { x: @x_position, y: @y_position }
            return 0
          end
          return 1 if in_the_abyss?
        end
      end

      def free_to_fall?(grid)
        if !grid.include?({ x: @x_position, y: @y_position + 1 })
          move_down
        elsif !grid.include?({ x: @x_position - 1, y: @y_position + 1 })
          move_down_and_left
        elsif !grid.include?({ x: @x_position + 1, y: @y_position + 1 })
          move_down_and_right
        else
          false
        end
      end

      def move_down
        @y_position += 1
      end

      def move_down_and_left
        @x_position -= 1
        @y_position += 1
      end

      def move_down_and_right
        @x_position += 1
        @y_position += 1
      end

      def in_the_abyss?
        @y_position > @max_y_position
      end
    end
  end

  #----
  class Day14Part2 < Day14Part1
    def run
      draw_cave_floor
      counter = 0
      loop do
        sand = SandUnit.new(max_y_position)
        break if sand.fall_into_position(grid).eql?(2)

        counter += 1
      end
      counter
    end

    private

    def draw_cave_floor
      adjusted_x_positions.each { |x| grid << { x: x, y: adjusted_y_position } }
    end

    def adjusted_y_position
      @adjusted_y_position ||= grid.map { |p| p[:y] }.max + 2
    end

    def adjusted_x_positions
      x_positions = grid.map { |p| p[:x] }
      (x_positions.min - 1000).upto(x_positions.max + 1000).to_a
    end
  end

  #-----
  module Day14
    def self.part_one(input_file)
      Aoc2022::Day14Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day14Part2.new(input_file).run
    end
  end
end
