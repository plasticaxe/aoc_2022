# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_07' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day07.part_one(File.join(Aoc2022::INPUT_FILES, 'day_07_example.txt'))).to be(95_437)
      end
    end

    context 'when executing part_one' do
      it 'has the right answer' do
        expect(Aoc2022::Day07.part_one(File.join(Aoc2022::INPUT_FILES, 'day_07.txt'))).to be(1_367_870)
      end
    end

    context 'when executing part_two_example' do
      it 'has the right answer' do
        expect(Aoc2022::Day07.part_two(File.join(Aoc2022::INPUT_FILES, 'day_07_example.txt'))).to be(24_933_642)
      end
    end

    context 'when executing part_two' do
      it 'has the right answer' do
        expect(Aoc2022::Day07.part_two(File.join(Aoc2022::INPUT_FILES, 'day_07.txt'))).to be(549_173)
      end
    end
  end
end
