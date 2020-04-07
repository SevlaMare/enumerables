require 'rspec/autorun'
require_relative '../main.rb'

RSpec.describe Enumerable do
  # variables to all tests
  let(:array_positive) { [1, 2, 3] }

  describe '#my_each' do
    # CASE 1 ( can  have multiples it)
    it 'iterates through array elements' do
      expect(array_positive.my_each { |element| element })
        .to eql(array_positive.each { |element| element })
    end
  end
end
