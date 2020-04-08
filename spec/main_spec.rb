require 'rspec/autorun'
require_relative '../main.rb'

RSpec.describe Enumerable do
  let(:array_numeric) { [-1, 0, 1] }
  let(:array_string) { %w[aaa bb 123 c] }

  let(:range_forward) { (1..3) }
  let(:array_unique) { [1] }

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

    it 'iterates through a range' do
      expect(range_forward.my_each { |x| x })
        .to eql(range_forward.to_a)
    end

    it 'array with only one element' do
      expect(array_unique.my_each { |x| x })
        .to eql(array_unique)
    end

    it 'If no block is given, an enumerator is returned.' do
      expect(array_numeric.my_each)
        .to be_a(Enumerable)
    end
  end
end
