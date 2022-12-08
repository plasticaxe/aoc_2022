# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_02' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day02.part_one(File.join(Aoc2022::INPUT_FILES, 'day_02_example.txt'))).to be(15)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day02.part_one(File.join(Aoc2022::INPUT_FILES, 'day_02.txt'))).to be(15_337)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day02.part_two(File.join(Aoc2022::INPUT_FILES, 'day_02_example.txt'))).to be(12)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day02.part_two(File.join(Aoc2022::INPUT_FILES, 'day_02.txt'))).to be(11_696)
      end
    end
  end
end
