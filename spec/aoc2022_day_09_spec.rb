# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_09' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day09.part_one(File.join(Aoc2022::INPUT_FILES, 'day_09_example.txt'))).to be(13)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day09.part_one(File.join(Aoc2022::INPUT_FILES, 'day_09.txt'))).to be(6181)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day09.part_two(File.join(Aoc2022::INPUT_FILES, 'day_09_example_part_two.txt'))).to be(36)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day09.part_two(File.join(Aoc2022::INPUT_FILES, 'day_09.txt'))).to be(2386)
      end
    end
  end
end
