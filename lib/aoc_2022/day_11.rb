# frozen_string_literal: true

module Aoc2022
  #----
  class Day11Part1
    def initialize(input_file)
      @monkeys = YAML.safe_load(parsed_contents(File.read(input_file).strip))
      @operation_counter = {}
      @worry_divider = 3
    end

    def run
      20.times { cycle }
      monkey_business
    end

    private

    def cycle
      @monkeys.each_with_index do |monkey, monkey_number|
        until monkey['items'].empty?
          @operation_counter[monkey_number] = @operation_counter[monkey_number].to_i + 1
          item_old = monkey['items'].shift
          item_new = adjust_worry_level(item_old, monkey['op'])
          pass_to_next_monkey(item_new, monkey)
        end
      end
    end

    def adjust_worry_level(old, operation)
      case operation[1]
      when '*'
        op_value = operation[2].eql?('old') ? old : operation[2]
        (old * op_value) / @worry_divider
      when '+'
        (old + operation[2]) / @worry_divider
      else
        raise Error
      end
    end

    def pass_to_next_monkey(item, monkey)
      @monkeys[destination(item, monkey)]['items'].push(modulo_of_test_lcm(item))
    end

    def destination(item, monkey)
      (item % monkey['test']).zero? ? monkey['if_true'] : monkey['if_false']
    end

    def modulo_of_test_lcm(item)
      (@modulo_of_test_lcm ||= {})[item] ||= item % test_lcm
    end

    def test_lcm
      @test_lcm ||= @monkeys.map { |m| m['test'] }.inject(&:lcm)
    end

    def monkey_business
      @operation_counter.values.max(2).inject(:*)
    end

    def parsed_contents(content)
      content.gsub!(/Monkey.*/, '')
      content.gsub!(/Starting items: (.*)/, '- items: [\1]')
      content.gsub!(/Operation: new = (.*) (.*) (.*)/, '  op: [\1, "\2", \3]')
      content.gsub!(/Test: divisible by/, '  test:')
      content.gsub!(/If true: throw to monkey/, 'if_true:')
      content.gsub!(/If false: throw to monkey/, 'if_false:')
      content
    end
  end

  #----
  class Day11Part2 < Day11Part1
    def run
      @worry_divider = 1
      10_000.times { cycle }
      monkey_business
    end
  end

  #-----
  module Day11
    def self.part_one(input_file)
      Aoc2022::Day11Part1.new(input_file).run
    end

    def self.part_two(input_file)
      Aoc2022::Day11Part2.new(input_file).run
    end
  end
end
