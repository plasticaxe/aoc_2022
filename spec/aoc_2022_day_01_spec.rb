# frozen_string_literal: true

require_relative 'spec_helper'

RSpec.describe Aoc2022 do
  describe 'day_01' do
    context 'part_one_example' do
      it 'should have the right answer' do
        expect(Aoc2022::Day01.part_one(File.join(Aoc2022::INPUT_FILES, 'day_01_example.txt'))).to be(24_000)
      end
    end

    context 'part_one' do
      it 'should have the right answer' do
        expect(Aoc2022::Day01.part_one(File.join(Aoc2022::INPUT_FILES, 'day_01.txt'))).to be(68_775)
      end
    end

    context 'part_two_example' do
      it 'should have the right answer' do
        expect(Aoc2022::Day01.part_two(File.join(Aoc2022::INPUT_FILES, 'day_01_example.txt'))).to be(45_000)
      end
    end

    context 'part_two' do
      it 'should have the right answer' do
        expect(Aoc2022::Day01.part_two(File.join(Aoc2022::INPUT_FILES, 'day_01.txt'))).to be(202_585)
      end
    end
  end
end
