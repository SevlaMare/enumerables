require 'rspec/autorun'
require_relative '../main.rb'

RSpec.describe Enumerable do
  let(:array_numeric) { [-1, 0, 1] }
  let(:array_string) { %w[aaa bb 123 c] }
  let(:array_unique) { [1] }
  let(:range_forward) { (1..3) }

  describe '#my_each' do
    context 'Iterates through an array of numbers' do
      it 'Should return the same array of input' do
        expect(array_numeric.my_each { |element| element })
          .to eql(array_numeric)
      end
    end

    it 'iterates through array of strings' do
      expect(array_string.my_each { |element| element })
        .to eql(array_string)
    end

    it 'array with only one element' do
      expect(array_unique.my_each { |x| x })
        .to eql(array_unique)
    end

    it 'iterates through a range' do
      expect(range_forward.my_each { |x| x })
        .to eql(range_forward.to_a)
    end

    it 'If no block is given, an enumerator is returned.' do
      expect(array_numeric.my_each)
        .to be_a(Enumerable)
    end
  end

  describe '#my_each_with_index' do
    context 'iterates through index and element of an array' do
      it 'Should return the input array' do
        expect(array_numeric.my_each_with_index { |element, index| "Element #{element} has index #{index}" })
          .to eql(array_numeric)
      end
    end

    it 'iterates through array of strings' do
      expect(array_string.my_each_with_index { |element, index| element + index.to_s })
        .to eql(array_string)
    end

    it 'If no block is given, an enumerator is returned.' do
      expect(array_numeric.my_each_with_index)
        .to be_a(Enumerable)
    end
  end

  describe '#my_select' do
    it 'If no block is given, an enumerator is returned.' do
      expect(array_numeric.my_select)
        .to be_a(Enumerable)
    end

    it 'Filter this array' do
      expect(array_numeric.my_select(&:even?))
        .to eql([0])
    end
  end

  describe '#my_map' do
    let(:my_proc) { proc { |i| i * i * i } }

    it 'If no block is given, an enumerator is returned.' do
      expect(array_numeric.my_map)
        .to be_a(Enumerable)
    end

    it 'Map this array with math operation' do
      expect(range_forward.my_map { |i| i * i })
        .to eql([1, 4, 9])
    end

    it 'Map this array with string' do
      expect(range_forward.my_map { 'cat' })
        .to eql(%w[cat cat cat])
    end

    it 'Map this array using proc' do
      expect(range_forward.my_map(&my_proc))
        .to eql([1, 8, 27])
    end
  end

  describe '#my_count' do
    it 'Count all elements.' do
      expect(array_numeric.my_count)
        .to eql(3)
    end

    it 'Count elements given as arg.' do
      expect(range_forward.my_count(1))
        .to eql(1)
    end

    it 'Count elements given condition.' do
      expect(array_numeric.my_count(&:odd?))
        .to eql(2)
    end
  end
end
