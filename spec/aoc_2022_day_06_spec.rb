# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_06' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2022::Day06.part_one(File.join(Aoc2022::INPUT_FILES, 'day_06_example.txt'))).to be(7)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2022::Day06.part_one(File.join(Aoc2022::INPUT_FILES, 'day_06.txt'))).to be(1929)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2022::Day06.part_two(File.join(Aoc2022::INPUT_FILES, 'day_06_example.txt'))).to be(19)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2022::Day06.part_two(File.join(Aoc2022::INPUT_FILES, 'day_06.txt'))).to be(3298)
      end
    end
  end
end
