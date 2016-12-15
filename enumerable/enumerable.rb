# goal: rebuild enumerable methods
#my_each, my_each_with_index, my_select, my_all?, my_any?, my_none?, my_count, my_map, my_inject
module Enumerable
  def my_each #replicate "each" method
    if block_given?
      self.length.times do |el|
        yield(self[el])
      end
    self
    end
  end

  def my_each_with_index
    if block_given?
      self.length.times do |idx|
        yield(self[idx], idx)
      end
      self
    end
  end

  def my_select
    if block_given?
      selected_arr = []
      self.my_each do |el|
        if yield(el)
          selected_arr.push(el)
        end
      end
      selected_arr
    end
  end

  def my_all?
    if block_given?
      if self.my_select {|el| yield(el)}.length == self.length
        puts true
      else
        puts false
      end
    end
  end

  def my_any?
    if block_given?
      if self.my_select {|el| yield(el)}.length > 0
        puts true
      else
        puts false
      end
    end
  end

  def my_none?
    if block_given?
      if self.my_select {|el| yield(el)}.length == 0
        puts true
      else
        puts false
      end
    end
  end

  def my_count
      puts self.length
  end

  def my_map(&proc)
    if block_given?
      mapped_arr = []
      self.my_each do |el|
        mapped_arr.push(proc.call(el))
      end
      mapped_arr
    end
  end
end

arr = [3, 21, 5, 11, 31]
arr.my_each {|el| puts el * 2} # => [2, 10, 14, 20] (yield needs parameter to define el)
arr.my_each {puts "aha"} #aha x 4 (yield doesnt need to carry parameter)
arr.my_each_with_index {|el, idx| puts "#{idx + 1}. #{el * 3}"}
arr.my_select {|el| el % 2 == 0} #10
arr.my_all? {|el| el % 2 == 0}
arr.my_any? {|el| el % 2 == 0}
arr.my_none? {|el| el % 2 == 0}
arr.my_count
arr.my_map {|el| p el + 5}
