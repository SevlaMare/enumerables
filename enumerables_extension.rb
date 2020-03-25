module Enumerable
  def my_each
    for i in 0..length
      yield(self[i])
    end
  end
end

# check
[1, 2, 3].my_each { |i| puts i }
