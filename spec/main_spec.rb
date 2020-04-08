require 'rspec/autorun'
require_relative '../main.rb'

RSpec.describe Enumerable do
  let(:array_numeric) { [-1, 0, 1] }
  let(:array_string) { %w[aaa bb 123 c] }
  let(:array_unique) { [nil] }
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

  describe '#my_inject' do
    it 'Cumulative sum with each element' do
      expect(range_forward.my_inject(:+))
        .to eql(6)
    end

    it 'Cumulative minus operation with each element' do
      expect(range_forward.my_inject(:-))
        .to eql(-4)
    end

    it 'Cumulative multiply each element' do
      expect(range_forward.my_inject(:*))
        .to eql(6)
    end

    it 'Cumulative operation with prevous and next element.' do
      expect(range_forward.my_inject { |sum, n| sum + n })
        .to eql(6)
    end
  end

  let(:array_with_nil) { [nil, true, 99] }
  let(:array_empty) { [] }
  let(:array_string_v2) { %w[ant bear cat] }

  describe '#my_all' do
    let(:array_domain_complex) { [1, 2i, 3.14] }

    it 'No block given, still should scan the array' do
      expect(array_with_nil.my_all?)
        .to be(false)
    end

    it 'Works in empty arrays' do
      expect(array_empty.my_all?)
        .to be(true)
    end

    it 'Recognizes different classes of numbers' do
      expect(array_domain_complex.my_all?(Numeric))
        .to be(true)
    end

    it 'Accept blocks' do
      expect(array_string_v2.my_all? { |word| word.length >= 3 })
        .to be(true)
    end

    it 'Should works with Regex' do
      expect(array_string_v2.my_all?(/t/))
        .to be(false)
    end
  end

  describe '#my_any' do
    let(:array_domain_complex) { [1, 2i, 3.14] }

    it 'No block given, still should scan the array' do
      expect(array_with_nil.my_any?)
        .to be(true)
    end

    it 'Works in empty arrays' do
      expect(array_empty.my_any?)
        .to be(false)
    end

    it 'Recognizes different classes of numbers' do
      expect(array_domain_complex.my_any?(Float))
        .to be(true)
    end

    it 'Accept blocks' do
      expect(array_string_v2.my_any? { |word| word.length >= 3 })
        .to be(true)
    end

    it 'Should works with Regex' do
      expect(array_string_v2.my_any?(/t/))
        .to be(true)
    end
  end
end
# LEFT = any, none, multiply_els
