# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_08' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day08.part_one(File.join(Aoc2022::INPUT_FILES, 'day_08_example.txt'))).to be(21)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day08.part_one(File.join(Aoc2022::INPUT_FILES, 'day_08.txt'))).to be(1669)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day08.part_two(File.join(Aoc2022::INPUT_FILES, 'day_08_example.txt'))).to be(8)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day08.part_two(File.join(Aoc2022::INPUT_FILES, 'day_08.txt'))).to be(331_344)
      end
    end
  end
end
