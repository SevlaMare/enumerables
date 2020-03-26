module Enumerable
  def my_each
    for count in 0..length - 1
      yield(self[count])
    end
  end

  def my_each_with_index
    for count in 0..length - 1
      yield(self[count], count)
    end
  end

  def my_select
    filter = []
    for i in self
      filter.push(i) if yield(i)
    end
    filter
  end

  def my_all?
    # future
  end

  def my_any?
    # future
  end

  def my_none?
    # future
  end

  def my_count
    # future
  end

  def my_map
    # future
  end

  def my_inject
    # future
  end

  def multiply_els
    # future
  end
end
