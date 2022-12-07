# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_03' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day03.part_one(File.join(Aoc2022::INPUT_FILES, 'day_03_example.txt'))).to be(157)
      end
    end

    context 'when executing part_one' do
      it 'has the right answer' do
        expect(Aoc2022::Day03.part_one(File.join(Aoc2022::INPUT_FILES, 'day_03.txt'))).to be(7446)
      end
    end

    context 'when executing part_two_example' do
      it 'has the right answer' do
        expect(Aoc2022::Day03.part_two(File.join(Aoc2022::INPUT_FILES, 'day_03_example.txt'))).to be(70)
      end
    end

    context 'when executing part_two' do
      it 'has the right answer' do
        expect(Aoc2022::Day03.part_two(File.join(Aoc2022::INPUT_FILES, 'day_03.txt'))).to be(2646)
      end
    end
  end
end
