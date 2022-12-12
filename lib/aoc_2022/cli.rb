# frozen_string_literal: true

require 'thor'

module Aoc2022
  # ---
  class CLI < Thor
    class_option :day, required: true, aliases: :d
    class_option :input_file, required: false, aliases: :i
    class_option :example, type: :boolean, aliases: :e

    desc 'print_solution', 'takes a day number and input file and prints the solution'

    def print_solution
      %w[one two].each do |part_num|
        if options[:input_file].nil?
          input_file = options[:example] ? example_input_file(part_num) : default_input_file(part_num)
          puts aoc_class.send("part_#{part_num}", input_file)
        else
          puts aoc_class.send("part_#{part_num}", options[:input_file])
        end
      end
    end

    default_task :print_solution

    no_commands do
      def aoc_class
        @aoc_class ||= Object.const_get("Aoc2022::Day#{day_number}")
      end

      def day_number
        @day_number ||= options[:day].rjust(2, '0')
      end

      def default_input_file(part_num)
        part_num_specific_file = File.join(Aoc2022::INPUT_FILES, "day_#{day_number}_part_#{part_num}.txt")
        return part_num_specific_file if File.exist?(part_num_specific_file)

        File.join(Aoc2022::INPUT_FILES, "day_#{day_number}.txt")
      end

      def example_input_file(part_num)
        part_num_specific_file = File.join(Aoc2022::INPUT_FILES, "day_#{day_number}_example_part_#{part_num}.txt")
        return part_num_specific_file if File.exist?(part_num_specific_file)

        File.join(Aoc2022::INPUT_FILES, "day_#{day_number}_example.txt")
      end
    end
  end
end
