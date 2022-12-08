# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_04' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day04.part_one(File.join(Aoc2022::INPUT_FILES, 'day_04_example.txt'))).to be(2)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day04.part_one(File.join(Aoc2022::INPUT_FILES, 'day_04.txt'))).to be(498)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day04.part_two(File.join(Aoc2022::INPUT_FILES, 'day_04_example.txt'))).to be(4)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day04.part_two(File.join(Aoc2022::INPUT_FILES, 'day_04.txt'))).to be(859)
      end
    end
  end
end
