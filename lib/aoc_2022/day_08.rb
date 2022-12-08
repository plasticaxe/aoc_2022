# frozen_string_literal: true

module Aoc2022
  #----
  class Day08Part1
    N_LIMIT = 0
    W_LIMIT = 0

    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map { |l| l.chars.map(&:to_i) }.freeze
    end

    def run
      tree_coords.count { |coords| visible_from_edge?(coords) } + edge_trees
    end

    private

    def tree_coords
      x_trees.flat_map { |x| y_trees.map { |y| [x, y] } }
    end

    def x_trees
      1.upto(@input.first.size - 2).to_a
    end

    def y_trees
      1.upto(@input.size - 2).to_a
    end

    def e_limit
      @e_limit ||= @input.first.size - 1
    end

    def s_limit
      @s_limit ||= @input.size - 1
    end

    def edge_trees
      (e_limit + s_limit) * 2
    end

    def visible_from_edge?(coords)
      x_val, y_val = coords
      visible_from_n?(x_val, y_val) || visible_from_s?(x_val, y_val) ||
        visible_from_e?(x_val, y_val) || visible_from_w?(x_val, y_val)
    end

    def visible_from_n?(x_val, y_val)
      (y_val - 1).downto(N_LIMIT) { |y1| return false if @input[y1][x_val] >= @input[y_val][x_val] }
      true
    end

    def visible_from_s?(x_val, y_val)
      (y_val + 1).upto(s_limit) { |y1| return false if @input[y1][x_val] >= @input[y_val][x_val] }
      true
    end

    def visible_from_e?(x_val, y_val)
      (x_val + 1).upto(e_limit) { |x1| return false if @input[y_val][x1] >= @input[y_val][x_val] }
      true
    end

    def visible_from_w?(x_val, y_val)
      (x_val - 1).downto(W_LIMIT) { |x1| return false if @input[y_val][x1] >= @input[y_val][x_val] }
      true
    end
  end

  #----
  class Day08Part2 < Day08Part1
    def run
      tree_coords.map { |coords| scenic_score(coords) }.max
    end

    private

    def scenic_score(coords)
      x_val, y_val = coords
      score_to_n(x_val, y_val) * score_to_s(x_val, y_val) * score_to_e(x_val, y_val) * score_to_w(x_val, y_val)
    end

    def score_to_n(x_val, y_val)
      score = 0
      (y_val - 1).downto(N_LIMIT) do |y1|
        score += 1
        break if @input[y1][x_val] >= @input[y_val][x_val]
      end
      score
    end

    def score_to_s(x_val, y_val)
      score = 0
      (y_val + 1).upto(s_limit) do |y1|
        score += 1
        break if @input[y1][x_val] >= @input[y_val][x_val]
      end
      score
    end

    def score_to_e(x_val, y_val)
      score = 0
      (x_val + 1).upto(e_limit) do |x1|
        score += 1
        break if @input[y_val][x1] >= @input[y_val][x_val]
      end
      score
    end

    def score_to_w(x_val, y_val)
      score = 0
      (x_val - 1).downto(W_LIMIT) do |x1|
        score += 1
        break if @input[y_val][x1] >= @input[y_val][x_val]
      end
      score
    end
  end

  #-----
  module Day08
    def self.part_one(input_file)
      Aoc2022::Day08Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day08Part2.new(input_file).run
    end
  end
end
