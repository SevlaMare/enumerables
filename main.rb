module Enumerable
  def my_each
    for count in self
      yield(self[count])
    end
  end

  def my_each_with_index
    for count in 0..length-1
      yield(self[count], count)
    end
  end
end
