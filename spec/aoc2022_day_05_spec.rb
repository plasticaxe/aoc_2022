# frozen_string_literal: true

RSpec.describe Aoc2022 do
  describe 'day_05' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day05.part_one(File.join(Aoc2022::INPUT_FILES, 'day_05_example.txt'))).to eq('CMZ')
      end
    end

    context 'when executing part_one' do
      it 'has the right answer' do
        expect(Aoc2022::Day05.part_one(File.join(Aoc2022::INPUT_FILES, 'day_05.txt'))).to eq('SPFMVDTZT')
      end
    end

    context 'when executing part_two_example' do
      it 'has the right answer' do
        expect(Aoc2022::Day05.part_two(File.join(Aoc2022::INPUT_FILES, 'day_05_example.txt'))).to eq('MCD')
      end
    end

    context 'when executing part_two' do
      it 'has the right answer' do
        expect(Aoc2022::Day05.part_two(File.join(Aoc2022::INPUT_FILES, 'day_05.txt'))).to eq('ZFSJBPRFP')
      end
    end
  end
end
