# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_06' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day06.part_one(File.join(Aoc2022::INPUT_FILES, 'day_06_example.txt'))).to be(7)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day06.part_one(File.join(Aoc2022::INPUT_FILES, 'day_06.txt'))).to be(1929)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day06.part_two(File.join(Aoc2022::INPUT_FILES, 'day_06_example.txt'))).to be(19)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day06.part_two(File.join(Aoc2022::INPUT_FILES, 'day_06.txt'))).to be(3298)
      end
    end
  end
end
