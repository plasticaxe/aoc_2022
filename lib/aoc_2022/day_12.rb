# frozen_string_literal: true

module Aoc2022
  #----
  class Day12Part1
    S_UPPERCASE_VALUE = 83
    E_UPPERCASE_VALUE = 69
    A_LOWERCASE_VALUE = 97
    Z_LOWERCASE_VALUE = 122

    def initialize(input_file)
      @input         = File.read(input_file).each_line(chomp: true).to_a.map(&:bytes)
      @starting_node = starting_node
      @ending_node   = ending_node
    end

    def run
      BreadthFirstSearch.new(graph, @starting_node).shortest_path_to(@ending_node).size - 1
    end

    private

    def nodes
      @nodes ||= @input.each_with_index.flat_map do |row, y_index|
        row.each_with_index.map { |value, x_index| Node.new(x_index, y_index, value) }
      end
    end

    def graph
      @graph ||= begin
        this_graph = Graph.new
        nodes.each { |n| all_adjacents(n).each { |a| this_graph.add_edge(n, a) } }
        this_graph
      end
    end

    def all_adjacents(node)
      [north(node), south(node), west(node), east(node)].compact
    end

    def north(base_node)
      return nil if base_node.y_index.zero?

      found_node = nodes.find { |n| n.x_index.eql?(base_node.x_index) && n.y_index.eql?(base_node.y_index - 1) }
      found_node.value <= base_node.value + 1 ? found_node : nil
    end

    def south(base_node)
      return nil if base_node.y_index.eql?(max_y)

      found_node = nodes.find { |n| n.x_index.eql?(base_node.x_index) && n.y_index.eql?(base_node.y_index + 1) }
      found_node.value <= base_node.value + 1 ? found_node : nil
    end

    def west(base_node)
      return nil if base_node.x_index.zero?

      found_node = nodes.find { |n| n.x_index.eql?(base_node.x_index - 1) && n.y_index.eql?(base_node.y_index) }
      found_node.value <= base_node.value + 1 ? found_node : nil
    end

    def east(base_node)
      return nil if base_node.x_index.eql?(max_x)

      found_node = nodes.find { |n| n.x_index.eql?(base_node.x_index + 1) && n.y_index.eql?(base_node.y_index) }
      found_node.value <= base_node.value + 1 ? found_node : nil
    end

    def starting_node
      s_node       = nodes.find { |n| n.value.eql?(S_UPPERCASE_VALUE) }
      s_node.value = A_LOWERCASE_VALUE - 1
      s_node
    end

    def ending_node
      e_node       = nodes.find { |n| n.value.eql?(E_UPPERCASE_VALUE) }
      e_node.value = Z_LOWERCASE_VALUE + 1
      e_node
    end

    def max_x
      @max_x ||= nodes.map(&:x_index).max
    end

    def max_y
      @max_y ||= nodes.map(&:y_index).max
    end

    # ---
    class Graph
      def add_edge(node_a, node_b)
        node_a.adjacents << node_b
      end
    end

    # ---
    class Node
      attr_accessor :x_index, :y_index, :value, :adjacents

      def initialize(x_index, y_index, value)
        @adjacents = Set.new
        @x_index   = x_index
        @y_index   = y_index
        @value     = value
      end

      def to_s
        "@x_index = #{@x_index}, @y_index = #{@y_index}, @value = #{@value}"
      end
    end

    # ---
    class BreadthFirstSearch
      def initialize(graph, source_node)
        @graph       = graph
        @source_node = source_node
        @visited     = Set.new
        @edge_to     = {}

        bfs(source_node)
      end

      def shortest_path_to(node)
        return [] unless path_is_known_to?(node)

        path = []
        while node != @source_node
          path.unshift(node)
          node = @edge_to[node]
        end
        path.unshift(@source_node)
      end

      private

      def bfs(node)
        [(queue = []), @visited].each { |a| a << node }
        while queue.any?
          current_node = queue.shift
          current_node.adjacents.each do |adjacent_node|
            next if @visited.include?(adjacent_node)

            [queue, @visited].each { |a| a << adjacent_node }
            @edge_to[adjacent_node] = current_node
          end
        end
      end

      def path_is_known_to?(node)
        @visited.include?(node)
      end
    end
  end

  #----
  class Day12Part2 < Day12Part1
    def run
      starting_nodes.map do |n|
        BreadthFirstSearch.new(graph, n).shortest_path_to(@ending_node).size
      end.select(&:positive?).min - 1
    end

    private

    def starting_nodes
      # Undo initial value override for the starting node
      nodes.find { |n| n.value.eql?(A_LOWERCASE_VALUE - 1) }.value = A_LOWERCASE_VALUE
      nodes.select { |n| n.value.eql?(A_LOWERCASE_VALUE) }
    end
  end

  #-----
  module Day12
    def self.part_one(input_file)
      Aoc2022::Day12Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day12Part2.new(input_file).run
    end
  end
end
