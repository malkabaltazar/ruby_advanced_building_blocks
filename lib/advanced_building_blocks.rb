def bubble_sort(arr)
  (arr.length-1).times do
    j = 0
    while j < arr.length-1
      if arr[j] > arr[j+1]
        arr[j],arr[j+1] = arr[j+1],arr[j]
      end
      j += 1
    end
  end
  puts arr
end

#bubble_sort([4,3,78,2,0,2])

def bubble_sort_by(arr)
  (arr.length-1).times do
    j = 0
    while j < arr.length-1
      diff = yield(arr[j], arr[j+1])
      if diff > 0
        arr[j],arr[j+1] = arr[j+1],arr[j]
      end
      j += 1
    end
  end
  puts arr
end

#bubble_sort_by(["hi","hello","hey"]) do |left,right|
  #left.length - right.length
#end

module Enumerable

  def my_each
    x = 0
    self.length.times do
      if self.is_a?Hash
        keys = self.keys
        yield(keys[x], self[keys[x]])
      else
        yield(self[x])
      end
      x += 1
    end
    self
  end

  def my_each_with_index
    x = 0
    self.length.times do
      if self.is_a?Hash
        keys = self.keys
        yield(keys[x], self[keys[x]], x)
      else
        yield(self[x], x)
      end
      x += 1
    end
    self
  end

  def my_select
    arr = []
    self.my_each do |x|
      arr.push(x) if yield(x) == true
    end
    arr
  end

  def my_all?
    self.my_each do |x|
       if yield(x) == false
         return false
       end
    end
    true
  end

  def my_any?
    self.my_each do |x|
      if yield(x) == true
        return true
      end
    end
    false
  end

  def my_none?
    self.my_each do |x|
       if yield(x) == true
         return false
       end
    end
    true
  end

  def my_count(arg = nil)
    counter = 0
    if block_given?
      self.my_each {|x| counter += 1 if yield(x) == true}
    elsif arg != nil
      self.my_each {|x| counter += 1 if x == arg}
    else
      self.my_each {|x| counter += 1}
    end
    counter
  end

  def my_map
    new_arr = []
    self.my_each do |x|
      y = yield(x)
      new_arr.push(y)
    end
    new_arr
  end

  def my_inject(sum = nil)
    first = self.shift
    if sum == nil
      sum = first
    else
      sum = yield(sum, first)
    end
    self.my_each do |x|
      sum = yield(sum, x)
    end
    sum
  end

end

def multiply_els(arr)
  arr.my_inject {|sum, x| sum * x}
end

#proc1 = Proc.new {|x| x + 1}
#puts [2,4,5].my_map(&proc1) {|x| x + 1}
#if both a proc and block are given only execute the proc
