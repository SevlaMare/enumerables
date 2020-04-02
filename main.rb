# rubocop:disable Style/CaseEquality
module Enumerable
  def my_each
    return enum_for unless block_given?

    list = is_a?(Range) ? to_a : self

    count = 0
    while count < list.length
      yield(list[count])
      count += 1
    end
    list
  end

  def my_each_with_index
    return enum_for unless block_given?

    list = is_a?(Range) ? to_a : self

    count = 0
    while count < list.length
      yield(self[count], count)
      count += 1
    end
    list
  end

  # FILTER like
  def my_select
    return enum_for unless block_given?

    filter = []
    my_each { |element| filter.push(element) if yield(element) }
    filter
  end

  def my_all?(*args)
    lever = true
    if !args[0].nil?
      my_each { |element| lever = false unless args[0] === element }
    elsif !block_given?
      my_each { |element| lever = false unless element }
    else
      my_each { |element| lever = false unless yield(element) }
    end
    lever
  end

  def my_any?(*arg)
    lever = false
    if !arg[0].nil?
      my_each { |element| lever = true if arg[0] === element }
    elsif !block_given?
      my_each { |element| lever = true if element }
    else
      my_each { |element| lever = true if yield(element) }
    end
    lever
  end

  def my_none?(arg = nil, &block)
    !my_any?(arg, &block)
  end

  def my_count(num = nil)
    count = 0
    if num
      my_each { |element| count += 1 if element == num }
    elsif !block_given?
      count = length
    elsif !num
      my_each { |element| count += 1 if yield element }
    end
    count
  end

  def my_map(proc_x = nil)
    return enum_for unless block_given?

    map_list = []
    if proc_x.nil?
      my_each { |element| map_list.push(yield(element)) }
    else
      my_each { |element| map_list.push(proc_x.call(element)) }
    end
    map_list
  end

  # rubocop:disable Metrics/CyclomaticComplexity
  def my_inject(*args)
    list = is_a?(Range) ? to_a : self

    reduce = args[0] if args[0].is_a?(Integer)
    operator = args[0].is_a?(Symbol) ? args[0] : args[1]

    if operator
      list.my_each { |item| reduce = reduce ? reduce.send(operator, item) : item }
      return reduce
    end
    list.my_each { |item| reduce = reduce ? yield(reduce, item) : item }
    reduce
  end
  # rubocop:enable Metrics/CyclomaticComplexity
end

# Test my_inject
def multiply_els(list)
  list.my_inject(:*)
end
# rubocop:enable Style/CaseEquality
