module Enumerable
  def my_each
    for count in 0..length
      yield(self[count])
    end
  end

  def my_each_with_index
    for count in 0..length
      yield(self[count], count)
    end
  end
end
