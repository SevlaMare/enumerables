module Enumerable
  def my_each
    # your code here
  end
end

class Array 
  def my_each
    i = 0
    while i < self.size
        yield(self[i])  
        i+=1      
    end
    self
  end
end

[1,2,3].my_each { |i| puts i}
