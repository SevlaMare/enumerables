module Enumerable
  def my_each
    for i in 0..self.length
      yield( self[i] )
    end
    self
  end
end

# test
[1,2,3].my_each { |i| puts i}
{'k1'=>'v1','k2'=>'v2'}.my_each { |i| puts i}