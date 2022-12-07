# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Aoc2022 do
  describe 'day_01' do
    context 'when executing part one example' do
      it 'has the right answer' do
        expect(Aoc2022::Day01.part_one(File.join(Aoc2022::INPUT_FILES, 'day_01_example.txt'))).to be(24_000)
      end
    end

    context 'when executing part one' do
      it 'has the right answer' do
        expect(Aoc2022::Day01.part_one(File.join(Aoc2022::INPUT_FILES, 'day_01.txt'))).to be(68_775)
      end
    end

    context 'when executing part two example' do
      it 'has the right answer' do
        expect(Aoc2022::Day01.part_two(File.join(Aoc2022::INPUT_FILES, 'day_01_example.txt'))).to be(45_000)
      end
    end

    context 'when executing part two' do
      it 'has the right answer' do
        expect(Aoc2022::Day01.part_two(File.join(Aoc2022::INPUT_FILES, 'day_01.txt'))).to be(202_585)
      end
    end
  end
end
