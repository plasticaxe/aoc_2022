# frozen_string_literal: true

module Aoc2022
  #----
  class Day02Part1
    SHAPE_ONE   = { 'A' => :rock,
                    'B' => :paper,
                    'C' => :scissors }.freeze
    SHAPE_TWO   = { 'X' => :rock,
                    'Y' => :paper,
                    'Z' => :scissors }.freeze
    SHAPE_SCORE = { rock: 1, paper: 2, scissors: 3 }.freeze
    WIN         = 6
    DRAW        = 3
    LOSE        = 0

    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a.map { |i| i.split.map(&:strip) }
    end

    def run
      @input.map { |r| score(SHAPE_ONE[r[0]], SHAPE_TWO[r[1]]) }.sum
    end

    private

    def score(shape_one, shape_two)
      SHAPE_SCORE[shape_two] + if draw?(shape_one, shape_two)
                                 DRAW
                               elsif win?(shape_one, shape_two)
                                 WIN
                               else
                                 LOSE
                               end
    end

    def draw?(shape_one, shape_two)
      (@draw ||= {})[[shape_one, shape_two]] ||= shape_one.eql?(shape_two)
    end

    def win?(shape_one, shape_two)
      (@win ||= {})[[shape_one,
                     shape_two]] ||= [%i[scissors rock], %i[rock paper],
                                      %i[paper scissors]].include?([shape_one, shape_two])
    end
  end

  #----
  class Day02Part2 < Day02Part1
    RESULT = { 'X' => :lose,
               'Y' => :draw,
               'Z' => :win }.freeze

    def run
      @input.map { |r| score(SHAPE_ONE[r[0]], required_shape(SHAPE_ONE[r[0]], RESULT[r[1]])) }.sum
    end

    private

    def required_shape(shape_one, result)
      (@required_shape ||= {})[[shape_one,
                                result]] ||= result.eql?(:draw) ? shape_one : discover_shape(shape_one, result)
    end

    def discover_shape(shape_one, result)
      SHAPE_TWO.each_value do |shape_two|
        if result.eql?(:win)
          return shape_two if win?(shape_one, shape_two)
        else
          return shape_two unless win?(shape_one, shape_two) || draw?(shape_one, shape_two)
        end
      end
    end
  end

  #-----
  module Day02
    def self.part_one(input_file)
      Aoc2022::Day02Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day02Part2.new(input_file).run
    end
  end
end
