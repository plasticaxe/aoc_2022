# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_10' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day10.part_one(File.join(Aoc2022::INPUT_FILES, 'day_10_example.txt'))).to be(13_360)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day10.part_one(File.join(Aoc2022::INPUT_FILES, 'day_10.txt'))).to be(14_240)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day10.part_two(File.join(Aoc2022::INPUT_FILES, 'day_10_example.txt'))).to be(8084)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day10.part_two(File.join(Aoc2022::INPUT_FILES, 'day_10.txt'))).to be(7997)
      end
    end
  end
end
