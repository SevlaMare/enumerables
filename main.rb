module Enumerable
  # loop over array
  def my_each
    for element in self
      yield(element)
    end
  end

  # iterate over array
  def my_each_with_index
    for index in 0..length - 1
      yield(self[index], index)
    end
  end

  # FILTER - return elements which match block condition
  def my_select
    filter = []
    my_each { |element| filter.push(element) if yield(element) }
    filter
  end

  # check if all array elements match the given condition
  def my_all?(*args)
    lever = true
    # given class as arg, check if all elements belong to same class
    if !args[0].nil?
      my_each { |element| lever = false unless args[0] === element }
    elsif !block_given?
      my_each { |element| lever = false unless element }
    # given block
    else
      my_each { |element| lever = false unless yield(element) }
    end
    lever
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

  # MAP
  def my_map
    map_list = []
    my_each { |element| map_list.push(yield(element)) }
    map_list
  end

  # REDUCE
  def my_inject
    # next
  end
end
