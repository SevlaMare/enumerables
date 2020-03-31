module Enumerable
  # loop over elements in array
  def my_each
    # convert range to array so can use length
    list = Range ? to_a : self
    i = 0
    while i < list.length
      yield(list[i])
      i += 1
    end
    # explicity return otherwise nil
    list
  end

  # iterate over array
  def my_each_with_index
    # TODO: change to while
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
      my_each { |element| lever = false unless args[0] === element } # instead of ifs
    elsif !block_given?
      my_each { |element| lever = false unless element }
    # given block
    # Rubocop issue, else can allow unexpect edge case pass
    else
      my_each { |element| lever = false unless yield(element) }
    end
    lever
  end

  # true if at least one element match condition
  def my_any?(*arg)
    lever = false
    if !arg[0].nil?
      # Rubocop CaseEquality false, because explicity one case
      # for every single class is not reasonable
      my_each { |element| lever = true if arg[0] === element }
    elsif !block_given?
      my_each { |element| lever = true if element }
    else
      my_each { |element| lever = true if yield(element) }
    end
    lever
  end

  # check if there is no one element with given conditions
  def my_none?(arg = nil, &block)
    !my_any?(arg, &block)
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

  # MAP like
  def my_map
    map_list = []
    my_each { |element| map_list.push(yield(element)) }
    map_list
  end

  # REDUCE like
  def my_inject(operator = nil)
    reduce = 0
    my_each { |element| reduce = element.send(operator, element) }
    reduce
  end
end
