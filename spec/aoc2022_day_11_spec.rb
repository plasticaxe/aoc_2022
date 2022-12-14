# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_11' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day11.part_one(File.join(Aoc2022::INPUT_FILES, 'day_11_example.txt'))).to be(10_605)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day11.part_one(File.join(Aoc2022::INPUT_FILES, 'day_11.txt'))).to be(70_176)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day11.part_two(File.join(Aoc2022::INPUT_FILES, 'day_11_example.txt'))).to be(2_713_310_158)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day11.part_two(File.join(Aoc2022::INPUT_FILES, 'day_11.txt'))).to be(19_573_408_701)
      end
    end
  end
end
