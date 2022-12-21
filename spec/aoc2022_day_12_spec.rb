# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_12' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day12.part_one(File.join(Aoc2022::INPUT_FILES, 'day_12_example.txt'))).to be(31)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day12.part_one(File.join(Aoc2022::INPUT_FILES, 'day_12.txt'))).to be(447)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day12.part_two(File.join(Aoc2022::INPUT_FILES, 'day_12_example.txt'))).to be(29)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day12.part_two(File.join(Aoc2022::INPUT_FILES, 'day_12.txt'))).to be(446)
      end
    end
  end
end
