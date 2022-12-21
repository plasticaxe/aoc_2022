# frozen_string_literal: true

module Aoc2022
  #----
  class Day07Part1
    MAX_DIR_SIZE = 100_000

    def initialize(input_file)
      @input = File.read(input_file).each_line(chomp: true).to_a
    end

    def run
      all_dir_sizes.select { |v| v <= MAX_DIR_SIZE }.sum
    end

    private

    def file_system
      @file_system ||= FileSystemMapper.new.create_filesystem(@input)
    end

    def all_dir_sizes
      @all_dir_sizes ||= file_system.map { |n| n.map { |c| c.content.to_i }.sum if n.has_children? }.compact.sort
    end

    # ---
    class FileSystemMapper
      def initialize
        @root_node   = Tree::TreeNode.new('/')
        @current_dir = @root_node
      end

      def create_filesystem(input)
        input[1..].grep_v(/^\$ ls/).each { |line| process_line(line) }
        @root_node
      end

      private

      def process_line(line)
        case line
        when /^\$ cd/
          @current_dir = line.split.last.eql?('..') ? @current_dir.parent : @current_dir[line.split.last]
        when /^dir/
          @current_dir << Tree::TreeNode.new(line.split.last)
        else
          size, file = line.split
          @current_dir << Tree::TreeNode.new(file, size)
        end
      end
    end
  end

  #----
  class Day07Part2 < Day07Part1
    DISK_SIZE              = 70_000_000
    MINIMUM_REQUIRED_SPACE = 30_000_000

    def run
      all_dir_sizes.each_cons(2) { |v1, v2| return v2 if disk_space_shortfall.between?(v1, v2) }
    end

    def disk_space_shortfall
      @disk_space_shortfall ||= MINIMUM_REQUIRED_SPACE - (DISK_SIZE - all_dir_sizes.max)
    end
  end

  #-----
  module Day07
    def self.part_one(input_file)
      Aoc2022::Day07Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day07Part2.new(input_file).run
    end
  end
end
