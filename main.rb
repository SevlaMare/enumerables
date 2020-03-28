module Enumerable
  # loop over array
  def my_each
    for element in self
      yield(element)
    end
  end

  # iterate over array
  def my_each_with_index
    for element in self
      yield(self[element], index)
    end
  end

  # return elements which match block condition
  def my_select
    filter = []
    my_each { |element| filter.push(element) if yield(element) }
    filter
  end

  # count elements in object, allow one argument
  def my_count(num = nil)
    count = 0

    # has arg
    if num
      my_each { |element| count += 1 if element == num }

    # don't have block
    elsif !block_given?
      count = length

    # don't have arg
    elsif !num
      my_each { |element| count += 1 if yield element }
    end
    count
  end
end
