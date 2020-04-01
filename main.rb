module Enumerable
  # loop over array
  def my_each
    # If no block is given, an Enumerator is returned
    return enum_for unless block_given?

    # convert range to array so can use length
    list = Range ? to_a : self

    count = 0
    while count < list.length
      yield(list[count])
      count += 1
    end
    # explicity return otherwise nil
    list
  end

  # loop over elements an index of an array
  def my_each_with_index
    return enum_for unless block_given?

    list = Range ? to_a : self

    count = 0
    while count < list.length
      yield(self[count], count)
      count += 1
    end
    list
  end

  # FILTER - return elements which match block condition
  def my_select
    # again since my_each only trigger when have block
    return enum_for unless block_given?

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
    return enum_for unless block_given?

    map_list = []
    my_each { |element| map_list.push(yield(element)) }
    map_list
  end

  # REDUCE like
  def my_inject(*args)
    list = Range ? to_a : self

    # start at first element not zero
    reduce = args[0] if args[0].is_a?(Integer)

    if operator
      list.my_each { |item| reduce = reduce ? reduce.send(operator, item) : item }
    # elsif block_given?
    else
      list.my_each { |item| reduce = reduce ? yield(reduce, item) : item }
    end
    reduce
  end
end
